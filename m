Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7528BFE55E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 20:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfKOTDt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 14:03:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37097 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfKOTDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:03:49 -0500
Received: by mail-pj1-f66.google.com with SMTP id f3so124215pjg.4
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=CItPl+9P9+Q2TvkS0KNj7T6lUO5RrCBXTMq+P1IrozI=;
        b=fTUOjzz0c+MpugZS8j11LWtRYO++p/2pPTdRTsUUXFw6cddxeRnTwMHEJvk3uKCn43
         qjrFM8hAF5rmwUuQL1GEUmb1Tx50Gwdk417B6MwR/hC7t84z8MjQUdHSzziuOxnEVvxA
         4uPhJHQxobJ4qEyTHhMwXugB0zYcCcZab7I90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=CItPl+9P9+Q2TvkS0KNj7T6lUO5RrCBXTMq+P1IrozI=;
        b=nBqSv8i8k+tmGOuICHO4uXMBeiU6tfq4diCIwfiYp2//iys7ZYHHIyHWIPngPtYppk
         Hpyz8rcoSsTsjljIV7BCTzQ9eU4uHctbK7Qkxyb/1LOq8GgZguagyACcAWvH3DGDBY0b
         PO3Iy8aSKUIBqC/f+O4Ka23qjuBxCjeTazpMSAypAxNRWSiICv6L/j+Dzt2Lf+JZv6gr
         0t4NMLC5Bkc8XGkR17XchuBOgxxmkzVSxyVYoUTbsmCENihBFSePo3XXf6Mj+roZBhv0
         ZvZognC/sOr623WyHfMhfl7yPd4ZFgtbASmoysgFmqdHbYetHn5eXbWaCalZ8mkSeJdZ
         K9GQ==
X-Gm-Message-State: APjAAAV8auIreu0/y9PSWIcegOPg3fdbTo5Uf2ybNQKrhG2g4yP0klsN
        wUylVnX9KTGi72qySRm+Bkv42w==
X-Google-Smtp-Source: APXvYqxLRZS01cyzrRirbFraHJFYIChiF+BHqALpfMTIDItddpzmzytlLjElRT+Q7jKHqbXMOW+/nw==
X-Received: by 2002:a17:902:d88a:: with SMTP id b10mr16505414plz.302.1573844628633;
        Fri, 15 Nov 2019 11:03:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z7sm10567669pgk.10.2019.11.15.11.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:03:48 -0800 (PST)
Message-ID: <5dcef694.1c69fb81.3b0c5.e9eb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-6-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-6-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        devicetree@vger.kernel.org
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 05/12] of: irq: document properties for wakeup interrupt parent
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:03:47 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:14)
> Some interrupt controllers in a SoC, are always powered on and have a
> select interrupts routed to them, so that they can wakeup the SoC from
> suspend. Add wakeup-parent DT property to refer to these interrupt
> controllers.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

