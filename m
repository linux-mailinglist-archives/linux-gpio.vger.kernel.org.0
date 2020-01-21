Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61292144469
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2020 19:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgAUSis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jan 2020 13:38:48 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38038 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729261AbgAUSis (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jan 2020 13:38:48 -0500
Received: by mail-pl1-f196.google.com with SMTP id f20so1705723plj.5
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jan 2020 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:cc:to:from:user-agent:date;
        bh=WxV6dyVTVKbwDTmHI1PEXvBt0/vhMfR4VpCjB4pvFvc=;
        b=lZ+0PgQlkA83kPsDqHEx2g3dps1viqHOORC844RNZ+tHapd3BQc+nmgo4t8nSae01E
         xDpqcE2e1iX2owmIN7FWLTcTYZu0/l3O0xpT/YopxdT2mWlNypPECQspMPm9KU2drTTu
         mp71fiR7tsMS/3H97dHAyUorzIKI3EwsmTZJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:cc:to:from
         :user-agent:date;
        bh=WxV6dyVTVKbwDTmHI1PEXvBt0/vhMfR4VpCjB4pvFvc=;
        b=CHEAhKyAlqBDfIcpYGCwv3VPRE/Z2tRcrxalwlcTTbiK/CSehCDA06OYdGJ+3TtjGl
         T/RRHrZ3rujj/JfQgRlZjj2jndYctttec1n118lPhMxr/DPz/63Ob8ZTrh6oR7MWG8Vx
         A5CFFkS8ZI85aVfknhl8moVAGVFnxnd1k11dcKEbubMMV7sbu5PMDFPljDLl+T4n0IAC
         MKEiWWINhHK1PIjsNpwEiWO/szDdlqf1WIFSHDNxjNbpe8PyMISOPcDsyL+81Walh0Pb
         e/WprFt/TZlTd3lIZjIlE0kPftDv3TUqRpGr0mO+e+Z++PVUfMg23qmkJKURfpSGEZrX
         +dAQ==
X-Gm-Message-State: APjAAAWR0VbFOUsYi+Trig3deDfZxtUhqtRugEMpdiIDsaRoxNQwYig6
        xLQ/PYJfmm6kSqc37X7c/QNtSg==
X-Google-Smtp-Source: APXvYqxWT3/UBuZQoVoxdqELNaCNFWPct/1TYX2wzaBljeyZhH2i9hUMGIUjJWCMLn58ARqKvTTnOw==
X-Received: by 2002:a17:90a:e2ce:: with SMTP id fr14mr6675221pjb.99.1579631927609;
        Tue, 21 Jan 2020 10:38:47 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i3sm45853513pfo.72.2020.01.21.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 10:38:47 -0800 (PST)
Message-ID: <5e274537.1c69fb81.a77e7.08fd@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200121183519.GP1511@yoga>
References: <20200121180950.36959-1-swboyd@chromium.org> <20200121183519.GP1511@yoga>
Subject: Re: [PATCH] pinctrl: qcom: Don't lock around irq_set_irq_wake()
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 21 Jan 2020 10:38:46 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Bjorn Andersson (2020-01-21 10:35:19)
> On Tue 21 Jan 10:09 PST 2020, Stephen Boyd wrote:
>=20
> >   __vfs_write+0x54/0x18c
> >   vfs_write+0xe4/0x1a4
> >   ksys_write+0x7c/0xe4
> >   __arm64_sys_write+0x20/0x2c
> >   el0_svc_common+0xa8/0x160
> >   el0_svc_handler+0x7c/0x98
> >   el0_svc+0x8/0xc
> >=20
> > Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
>=20
> This lock used to protect the wake_irqs bitmap, and although your change
> indicates that the locking was wrong before this point I think the fixes
> should be:
>=20
> Fixes: 6aced33f4974 ("pinctrl: msm: drop wake_irqs bitmap")
>=20
>=20
> Either way, the patch looks good.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>=20

Ok. Thanks for fixing the Fixes tag.

