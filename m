Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB47B3DD6F6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 15:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbhHBNX6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 09:23:58 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:45812
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233767AbhHBNX4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:23:56 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 888913F113
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627910626;
        bh=PcYv7A5UtpI/HN8IQPlYCtcicRurm0AO4HjAfUXrPFg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=JQ0GHuP65vX9piz3MEAq0p3R6U46Vua9V/4LJX0J8Pojfuw6HrFuY3oHI938PWvHR
         82WoZm4nUsCTPaL2rfBYo4qSyhfe1d8rSvh+xlsSeB2xcqAhtUxoqDou42BCISf2+u
         JGLRI+mvNBIzwUGdfXWPDr9NWUZVFx0zD86FVK3ETZqWig6k7pt+Ka7dlkFSsPAXCj
         MaO0MsvKR74ZCDkBBJKQnsNLXRUFHcAMDyjJ7g8og3343ljk8BVn2hvfptI1XvQQ9c
         j3+qbuI5MBCQ3trgd9J4tiwKDfOip1kMsBQ5SngvK0SvRSrwDlhzvzXYYOhB3W/uBv
         Ly/3mclpBU13A==
Received: by mail-ed1-f70.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so8773115edx.12
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 06:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PcYv7A5UtpI/HN8IQPlYCtcicRurm0AO4HjAfUXrPFg=;
        b=W508BSDFachJl0MA1cfdc9PxC1ShX6kJZnPBpBprI3E1ty7t8WiqzsCp4aux/OeXEf
         6j+osBdBnDpida6GgPnNzNWqJJcDw7UF4iSvtrA1c5VtNEKRAw5IXD9P8Ud/445XJCRR
         4p+zmk9xyrKvI4BBfWXwGKJ5/0JdysNWsKAaTRiBUtZEiz63AR9Kq3CtnBaoPubnbW2X
         cvvWZsbNCMzH+Q4FJGASy738yqLQW0W4kBdJFiR66jYsIAK9Utsh+aC2A0dfpf4+Bkdj
         FOZwfK3HAWx+j16iW+NuuuqaEESsqA0XnufnCB5wg2amkX0Bdk4pZKinW1duvc08Y/vb
         htrA==
X-Gm-Message-State: AOAM530Dr94aITIkydtz7tQIqYrEZ7vIsCGlHxrUFJQzZNjxG+CpKv7Y
        w36n4mKfV3H1JNOXPpxsgvbRJtqAKN1rlFUFpPx0NTKc/RF8kIu/0vxxJ6OtJEPM5Q/frVY7tW3
        worJ4tNgpHJ7aZjMWMoEIp/Af9hUOE8CY9OhlpKs=
X-Received: by 2002:a17:906:3042:: with SMTP id d2mr15817504ejd.234.1627910626320;
        Mon, 02 Aug 2021 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrA4flDvX+BAKewMQjdgTQYWuHYej9xPjsM1AuxVjzU8xxeUklp6WM1diAO6OrzbRfygP/bA==
X-Received: by 2002:a17:906:3042:: with SMTP id d2mr15817484ejd.234.1627910626191;
        Mon, 02 Aug 2021 06:23:46 -0700 (PDT)
Received: from localhost.localdomain ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id gv7sm4648671ejc.5.2021.08.02.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:23:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] pinctrl: samsung: Fix pinctrl bank pin count
Date:   Mon,  2 Aug 2021 15:23:42 +0200
Message-Id: <162791061524.24470.4507251211900093020.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730192905.7173-1-semen.protsenko@linaro.org>
References: <20210730192905.7173-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Jul 2021 22:29:05 +0300, Sam Protsenko wrote:
> Commit 1abd18d1a51a ("pinctrl: samsung: Register pinctrl before GPIO")
> changes the order of GPIO and pinctrl registration: now pinctrl is
> registered before GPIO. That means gpio_chip->ngpio is not set when
> samsung_pinctrl_register() called, and one cannot rely on that value
> anymore. Use `pin_bank->nr_pins' instead of `pin_bank->gpio_chip.ngpio'
> to fix mentioned inconsistency.

Applied, thanks!

[1/1] pinctrl: samsung: Fix pinctrl bank pin count
      commit: 70115558ab02fe8d28a6634350b3491a542aaa02

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
