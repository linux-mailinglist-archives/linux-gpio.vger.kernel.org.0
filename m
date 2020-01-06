Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B899D131BC5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2020 23:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgAFWrM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 17:47:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36800 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgAFWrM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 17:47:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so52636655ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2020 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=g0z+DSnklv6iu5J3Afvb/fXFAHDuKf7PzDA3LoC2ygbFu0coxpdCIpffPdp82RveZi
         cxryO/aUuIb0EuNFY1w/n7kDCOM7UzXHAV0vuSths54Yk3/4ciJbNe0FhvUUW2KJSGzu
         AMY4hSpKCEmEOOMceh+ndpGA/p1Jl+K7DK8G8Y2RWW3VXr77AbKNU+2h1w6vO9VxpY/6
         IEfb2xnPwuQqLNBwdriTJsu5OLJ4oxpyLDAtNH83LXZopMOmpJRnqlwKBW+rHFlbMncF
         UI3c4G4AVCT8yI4HVpksGA9rdtH0CrgOQBk+zoJEPb24vN3aVTasxKrKGAWkQjxKMCPv
         CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iINXiMFidNPmE7c3AtxT3THDZ1hEuF3OMM13Pg6sk6w=;
        b=d21IsPT88LMKTGOr2iouBbZM/od2SuMeFYLp+0UFgJzxQ/s9+6n8z+gma9zLPY/6L7
         Fzzf+yjDO1IaPlhFmbPxblXi9+XsWfP4SM7QfIEw3bcc1lhNEaoZrwM8kKHzDoEXPGrh
         pZ1wVKd+o06Z9EfTIoxDUh+ivnNws6RXeEj0ZuvwLZ9qr+HOsjIirz0czlkNUlXG5HQc
         u41RtjcRjfdbSodrI08S7On+i2jmjB1eJSb98TIVQElPIeufx1AT6QN6OXJ22ZsXGr5E
         qJDkhN1JlHu1iiEUpwISFIOsyK4PjnSMrFYEEQ5aRbToflasiyu1wDJSDsmDfpLYwsRh
         SJ0g==
X-Gm-Message-State: APjAAAVhoGrsqAOMi7jSxrPgfqy2HPPin4fr1suPV17ES19KppiLb5vS
        N3kSD6whwzqzoUCmPXnuwPCGUyGwjg4Ri/WL+ECdFQ==
X-Google-Smtp-Source: APXvYqyb4+z1PnlvO0PT0IM3lRyC4AM5S5O/rRzCFuE2xIcizWcFowXRhyD9waT90956XcAyA0plvbvrQ5LOJyWoZwA=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr50441415ljj.77.1578350830450;
 Mon, 06 Jan 2020 14:47:10 -0800 (PST)
MIME-Version: 1.0
References: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com> <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1576426864-35348-2-git-send-email-zhouyanjie@wanyeetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Jan 2020 23:46:59 +0100
Message-ID: <CACRpkdbfZjqd_ChPhX52wwu56TwXQJhHyUvRVRKw6WUD33utCw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Fix bugs in X1000/X1500 and add X1830 pinctrl
 driver v8
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Rutland <mark.rutland@arm.com>, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 5:21 PM =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:

> v7->v8:
> Separate the part of introduce reg_offset in [4/4] in v7 into [3/5] in v8=
.

Patches applied. Sorry it took so long.

Yours,
Linus Walleij
