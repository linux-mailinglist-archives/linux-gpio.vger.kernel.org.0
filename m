Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F80B5A2E8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 19:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfF1R56 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 13:57:58 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:32957 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfF1R56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 13:57:58 -0400
Received: by mail-pl1-f172.google.com with SMTP id c14so3662184plo.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
        b=QidYQZ1e5tVfpSNlbzJAwZ1PSEo4dbT1h4HX6qlUhaYy/0WDP2DbYNFPTucwsPtXtJ
         P5Da3q4BSmLlg7YBmA0owHM1bUPrEb7BS8gzdHoNIWge3t/+SscDfMMBa3vx9swwjY5n
         LFvDrn5pgiwG3LzawIGsvptYLxKuORQdAVK4jqhJjDPscsuEl0XBsIcIhtmOUiqLnY31
         rl5J0Is/8LGOWfkwroXrx5lrTEZnf+8x1H9rCHGrYrmt0cwF3/5ZHvKqdnUE5x9l17cs
         65Qi5bpDUOP3xQ2tieEt795doUy4MrobU1fhvRK9NMQeo5arbU4RPh5V9yXTVNhCQ2rL
         ovHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=JXDx5Of53xKpwKzie292LEzpOCIt7HdxAp/TZojOC98=;
        b=NuqHk1IYc+4Kix/52jeAMzf85Onb9np4RFG9F/RjYdqopTjX6h/BeFuDOo0JHd5TJm
         M87KH03/hCUttGa+/NR3KorZ+qmty5N3iDo4QunT6xyu5wtWRoejVpq/tEZsdPv3bmuv
         aPtGVuJWC8xzwl1A3V/VRZS1eZlCpSU/fGXsG106OoqkUFPyciQbBrZJcEgYWBBisKTm
         xI3luXrF7CiNU0Qh2DFZE6ZM22SdrbahheUJfdDCM3BqRQGFt5XCxxgno7XqgqnLJHp5
         Hmz9O36bKzlpm0zPXEVbuuKUKd5/Zvu3C21AcOR6j9KRN8rJcVzo7uBAyPykb/1g5/DP
         7AWQ==
X-Gm-Message-State: APjAAAXruHpqirp668mg2Ohusyx+DtdniPDU1QUhYTN1A3werdtapu12
        h13pJKq+jZXNDfw1bNflNlE/Jg==
X-Google-Smtp-Source: APXvYqxBvlNYSLn6PRoeEXRuFeavrw3x9z3+yywP5RFfiMDYAfvzlGijWI2kL3fNFlbko9TEHruOVA==
X-Received: by 2002:a17:902:3341:: with SMTP id a59mr12892929plc.186.1561744677360;
        Fri, 28 Jun 2019 10:57:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id c26sm2814912pfr.172.2019.06.28.10.57.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:57:56 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 05/14] soc: amlogic: meson-clk-measure: protect measure with a mutex
In-Reply-To: <20190626090632.7540-6-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-6-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 10:57:56 -0700
Message-ID: <7hsgrtr3rv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> In order to protect clock measuring when multiple process asks for
> a mesure, protect the main measure function with mutexes.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
