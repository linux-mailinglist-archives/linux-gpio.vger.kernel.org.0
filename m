Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53F1AAFAC
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 02:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfIFAL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 20:11:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39732 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730768AbfIFAL1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 20:11:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so2383942pgi.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 17:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=EG+/MUED2UsQmYwWnl+m4YuOSd+iLXFMVT1+SFmuY6c=;
        b=h1SJ6VKq8ziz5RC8etjR71RJ2+HMI7S05F2FIAd7599+cB/Mu/hr9Kxmr5ObJQEysF
         tP1VrtlZsu8SVBbc7DfKxTvbsJiV+dsJCVpAhxy9MrNEsfk23LnNZAqiH4/AhRv1hARF
         oDPuwAv77pmBKFQZs31UH2NVp7+GP1g+mAV8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=EG+/MUED2UsQmYwWnl+m4YuOSd+iLXFMVT1+SFmuY6c=;
        b=JeLwavJIQFP0GuThtc1JZ1OT8WCy68Vq2ll0FNDwu//hCsf5QPzk3f3K1YfOlsEPVU
         Re9qnjdcNIfeP0Bu/DrP/UyySmn08OSH+QcoQCRvKgrLIwtn0UIZJSUHv+O9cOttqhkd
         hksapN/j78kmj/oaNoUovEvm4fGg0FLh30z9gBzN0H8tAIUmrWilxXd00AJifn1IbSW6
         hSH/JPmmZaimLSCy0Jx/ILFKXW+ZKfwhJESrIjv5j2hYAP2kNNkU1zEEHkS/Zy4WaiOk
         wCVRWBkHKQz4tVtNZWV5doEAOB/iqT6OvC+kX8Q2fQ5OK0xUhMIuvN87z8B0maU7ZYA+
         eU6g==
X-Gm-Message-State: APjAAAUiYhUukEh2Le+LYxUtoW8e3EAURsXcmxIMBWcORBtDXEAd0xtI
        JVwvsphd5aEEH8jYm25SR5hVwA==
X-Google-Smtp-Source: APXvYqwLhj+gPLsunu19pmG77d0/jojdsmDQ/S673OcY6GTlSwQiF/q78gZDnO+Xepr37qc8Kslp7g==
X-Received: by 2002:a62:1d8a:: with SMTP id d132mr7213725pfd.187.1567728686428;
        Thu, 05 Sep 2019 17:11:26 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u9sm3106745pjb.4.2019.09.05.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:11:26 -0700 (PDT)
Message-ID: <5d71a42e.1c69fb81.b56a6.852e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-10-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-10-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 09/14] drivers: pinctrl: msm: fix use of deprecated gpiolib APIs
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:11:25 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The subject is misleading. It's not fixing anything, just moving away
from deprecated to "supported" APIs.

Quoting Lina Iyer (2019-08-29 11:11:58)
> Replace gpiochip_irqchip_add() and gpiochip_set_chained_irqchip() calls
> by populating the gpio_irq_chip data structures instead.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
