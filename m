Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60676AAFE7
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 02:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391576AbfIFAjy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 20:39:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43509 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391426AbfIFAjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 20:39:54 -0400
Received: by mail-pg1-f195.google.com with SMTP id u72so2412743pgb.10
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=UgLwGOLd9Qaofpb/EMRahwjwW4TzGd9hkLOFeY5MZAY=;
        b=VKalJm2EThnQ27lsNLgCNQVCIu2xu0aPd0QmMEODnmLKOaOclAraltTAFz5qlLmPsz
         OrIA51ux0pzJWcRc2yp/pmbwTzvDB4HOW92Frt21D4wp9mkgTWh2fR9CTKbeHFvVcS50
         49B6sW1p1h3yjjezZwnpLETheL6yUorgutylc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=UgLwGOLd9Qaofpb/EMRahwjwW4TzGd9hkLOFeY5MZAY=;
        b=bEWkKsivpeoS8Ok9AIUnUgt8bn5favnz9iMRSroX3JvGjAQjyjUatGMlNXSKMEPgMI
         ZoJWNQzmSjKey+m5hJa1dolV1wOZGwxv82LSv/s1tyV6OzEpCXRMmT4PsHLoUC2AorWd
         YSykPDeocg2mb+lHwQPgg/iyQ+1t6C/eiPk3jB+wnOSqh7xor1FHBG1YmeDbKrLyM2nT
         H+NsqdUge4LPK9+6nE0i+VUCmJWZrl5psWTnrJphSdE1pKdxbsOA40M/5GsMC4cQQjoj
         oXO8OiNgp/eioYtBZVX9l98hxEGK7NgbpJoQE4Bg8coAdbXhzWwhOv6eGPDlu9LUVrD8
         ZyCQ==
X-Gm-Message-State: APjAAAXPIZNXmrGOVlCf36K16ss4bKgv2QHxP/rD5N93EayvXPZkqQFb
        JapCtSAS3hrX6mjgzjk1pVDJDQ==
X-Google-Smtp-Source: APXvYqzsUIedg/kFHh7n2df4VYVSimGTOumXrGupH6BrHebKIF4HmZ8VC2KdVr+TA3cvwdNwNGA7AQ==
X-Received: by 2002:a62:d45a:: with SMTP id u26mr4972214pfl.137.1567730393567;
        Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 127sm7907733pfy.56.2019.09.05.17.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:39:53 -0700 (PDT)
Message-ID: <5d71aad9.1c69fb81.f469e.262f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-3-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-3-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 02/14] drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:39:52 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:11:51)
> When an interrupt is to be serviced, the convention is to mask the
> interrupt at the chip and unmask after servicing the interrupt. Enabling
> and disabling the interrupt at the PDC irqchip causes an interrupt storm
> due to the way dual edge interrupts are handled in hardware.
>=20
> Skip configuring the PDC when the IRQ is masked and unmasked, instead
> use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
> register at the PDC. The PDC's IRQ_ENABLE register is only used during
> the monitoring mode when the system is asleep and is not needed for
> active mode detection.

I think this is saying that we want to always let the line be sent
through the PDC to the parent irqchip, in this case GIC, so that we
don't get an interrupt storm for dual edge interrupts? Why does dual
edge interrupts cause a problem?

>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
