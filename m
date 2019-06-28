Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD98E5A2EE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 19:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfF1R6f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 13:58:35 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:34887 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfF1R6f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jun 2019 13:58:35 -0400
Received: by mail-pf1-f180.google.com with SMTP id d126so3365304pfd.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2019 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
        b=GiHzQpHEBzX787s/X1QIF6dApBZZr+1I94MMXG75kyPqsnypZvvVmyPXmqQ4DDWDP1
         BzcS004uag+6zBmiVow3iazQZwCovOnO+ZHlIt9I21QnI0F6Nflvj4dUWBUbhq7AbO/m
         SynTdJ4H2/6gv6sVDQ/Y6+Xb3rJWkBq67DXPBHgz+cu1AXl9k8kEn7My8wk8Hf4WKSc2
         DZFzfS/MxxvfSALWkxuMLiVFMJYmOEgRUhfPMprrAJXGAmg42GEl4SGnDGCvrnJcyTse
         bBCzUsjp+9FQDvCouNixum4aYfj7dm7fTO1MgaM/A1Gdfa8Xw4iAsFFkjztnwVtxortw
         zQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Vl3V/b9d/YR3BoBzMucBuY8z9bflVwMcEzHAzE43M8M=;
        b=uVn0/slpX5WuSwB0noj3sPoBaIRLwDrr1uVKrgwyAzmucxaKHBp17pQ5JWxPkuqGtm
         5p3nB2CNd5sibQ5wx4B9qs41hoz4RTyKA0NSXjDtrPTGYHrdrphUIMKDjxUSGec8oCJa
         UJhnCRp6Y5sQAJ83Nekb1Rb5VhwGCeSu1Q2oGTy2WE1S9Q1eWFM8riH+aMwWMhzwfMBy
         i0Ft8mVXNoFd+jPSIuShdnWVC9P56OdyQ2gDQoJFElPCSir1RKe5wyDHTTz5WYmUZ5w4
         JN/9XZtZL+1gcUe32HegDj6TDHc1K0m+jmop20wssqdHapGN521F19DH25wzJNjhqmuF
         tevQ==
X-Gm-Message-State: APjAAAWqWP5v+xytFb7sd4q0UjcL7XjfN/IRc9vuaW+5vFTeckZsLr/B
        O38jvcWK//e5fj327RPw39E96A==
X-Google-Smtp-Source: APXvYqz3zRSNG8ksCoG/kgVrFj0M6c77+R2i6vSlgO/BJ1CePZMBP9OvFZEvXFjF5JaAwCqI6GsMBQ==
X-Received: by 2002:a63:e057:: with SMTP id n23mr10491079pgj.228.1561744714489;
        Fri, 28 Jun 2019 10:58:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id 3sm2963791pfp.114.2019.06.28.10.58.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2019 10:58:33 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v2 06/14] soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
In-Reply-To: <20190626090632.7540-7-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com> <20190626090632.7540-7-narmstrong@baylibre.com>
Date:   Fri, 28 Jun 2019 10:58:33 -0700
Message-ID: <7hpnmxr3qu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.
>
> These IDs returns 0Hz on G12A.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
