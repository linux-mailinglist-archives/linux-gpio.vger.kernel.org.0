Return-Path: <linux-gpio+bounces-27605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E4290C08F4B
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 12:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55F1F4E2352
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 10:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E5C2F533B;
	Sat, 25 Oct 2025 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="bRucnxmH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A72C11EC
	for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761389556; cv=none; b=FzC3fMI9Zgf4xSpJ81BGvrYkQDD44sSBtcx4vF9U69fZ/6u97GD+0jyEif9/UGgyRPA/JBC3mbUbppubZdHNNFH8K2LcGwin2uI45ygHlxVsQLOrsMDfnX7goHfPFyFnYxg5Pq06ASRcdb7hWUaGJ6MFCIRFRpMzqL4GteFt+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761389556; c=relaxed/simple;
	bh=KGJUP5b0ZJrAZImBTCAgWCj4UuIQW/kFM/jxupcbutI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuYMIx7KhI0C6pYV2v6ucvlqlGN+S91rjeWUTLsKhROSZTNaMRSkz7LMkpcJVl40322TYDW5e8oD/MEetYilc+OkP3+3sxAQLA33ChFr7F/Isk3JHB/H+6JKcS5289SlVRgYqV6tJx0P/ITqhHa2v9ndPU23XJ8dnZe00VeVvi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=bRucnxmH; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B1433F2B2
	for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761389546;
	bh=OCHMeI4kxfBp9Em2gpVjN5LJLxAk0uYHQUh1uwccC3A=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bRucnxmHSAp2epFIetnIPweNaDCoDzrII7kGzqPNeZ9YEaC/12F5MzSOHbj052GWf
	 jiS67BeokrY3qu8lj49TltVNkrUGpWcAEVLE8vIXcPwd3MfRowNtQPKk1z1x0EFKlk
	 nfFafpkzetIOv9iGY3RD8TuZ+gX2h4/WamauJDEx0alsvZsap44/EC9tL2O/wb+35/
	 9MKBOS652d4/nRokcXUeP9rf7klT/YKHciPhqknsgY3TRqjoMDKd+l0TSpj63/Gr+m
	 kxPzHqvZ/+7fyFflg/PHlFhgSYHOwUYR/cDKkMd4adM1jQV2SmiuQM3yeN0LykQi2g
	 XdK791upnhwQ+l+pqCdBvWv+qEAhJw6Ikk1c4OjZ6eeY9brUEVWSu95Szdplf+1vxq
	 /rTLm8upGH/ngeDTAK5LGiihz9x0rTJdiW1iEpxiznOVCRDMd+3nDepbjkxsTf9Bj3
	 SG+0WPqK1Kop+yKBrzm1s2nthtW73K12pnycLFcC8eBqhC78uEcVpkmrb41w0MMXl7
	 FcRsoxiTda40m3lcaStFgt5y00pes/ex2+usXHqCIJ4LhqAbLBqVz/Q+HunZlHhNwj
	 lJB4auQ3cc3we0Rlhp2qZghJF35wqqpVH8pi71SwoOwB23LrDP24K92t1AtKvFsDco
	 z4Nz7sfBLU2qSG5jWM1QUaQo=
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5db34e16abfso1122903137.1
        for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 03:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761389545; x=1761994345;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCHMeI4kxfBp9Em2gpVjN5LJLxAk0uYHQUh1uwccC3A=;
        b=TPeAmnPrj1M89A8ptLgnI4wqiYo8Sam9UP9BmmA/qgF5X0xjyLK7w44N36K3dqUILm
         ksf+xtgmX3XI3avZVu/Ssyb7huWpaRqgV+U90JJlDlPiow+mtz+qhLVXknYsDTql3U+t
         XfEzg5VnFxs26LUwjYL6fBuQTc1ElQBJU34ZT77YuSTGiVUi+5VxnkqgOD06+gOaYdnI
         Jnve32loYmCoUPPtzvNHaInfl5jWuq+D0UHnkjtUb8K60LpLo/oZxxCEF4j8HleKDMIE
         oAS5tXwcb5V8Igm6nLIYpXAldOhIp413DZyDnMedZx82p7CKOqHys7t5BLrE8ihgRghH
         tDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVss7efS6OHpGkra4wkLK6Mk9PpP73AEntvQ4Ce4wXsDbbm2JBsv67fATvRVlEnAM8+4GuzLFDzDveh@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9N6KO1z8mpgpiyjvNHN8haEvDkcZk2czFu8iBflrSHgJSwWG
	LVzzPJqw5vGyf9guyAme7qnjLcIIpVWW7BneK4hAomNfsj62kuhO+Ax+9MyQPWCUqjwJe3/zCJY
	oBvvtuwG9yWjD+ga4mcksE413zyNAO19xZ3bRPJHe8rMFhmv6IqCW7DebgUuIOle0YXxNioQBdr
	bEMB026jcDqcX+dW8H0M9+N618ozem1jtssbbWbxuRPeUbaOJI27Rm6g==
X-Gm-Gg: ASbGncvzBMKBUbipStQgpHz3FjC+7dsIUh/lK7uARRtg0nwriu2kQiT/CGrRpV+a+5z
	SRyG5txiPb3u8jDI7MILfdajzQ8f8dvmiZwxrTSMUknSvdkFTyEoemlSUGIgoj5tI/Wu59rGcjn
	pQfwGj/1LBY1l1pEiP9UZ1S6cmohnvvbaM3lruPGzsr9ZpAp+6n3Py9w==
X-Received: by 2002:a05:6102:cd3:b0:5d5:f3c4:bda1 with SMTP id ada2fe7eead31-5db2e54ff81mr3166459137.28.1761389544840;
        Sat, 25 Oct 2025 03:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGP+ZEP2WLgAa4lFcqDaAq0N+XgEuDEypZ57bWQ/Uqq+gNLLm6Q8kQ99/dkVu/4l+4LPm0w6d0iiPLNqu5jbo=
X-Received: by 2002:a05:6102:cd3:b0:5d5:f3c4:bda1 with SMTP id
 ada2fe7eead31-5db2e54ff81mr3166447137.28.1761389544435; Sat, 25 Oct 2025
 03:52:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 25 Oct 2025 05:52:24 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 25 Oct 2025 05:52:24 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251024143353.71753-1-alitariq45892@gmail.com>
References: <CANBLGcygpsp=R5gM7NeuVO-JG1yfQJ_0dhnFfL1ud=291cJZAQ@mail.gmail.com>
 <20251024143353.71753-1-alitariq45892@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Sat, 25 Oct 2025 05:52:24 -0500
X-Gm-Features: AWmQ_bk8Dha5aFYepX37yjLdbmSv383QbGVCBJ3gbAZ5ACk1zwzK06CQqDqMmyg
Message-ID: <CAJM55Z-SrU1Mk4xUZTgey-zArYAvtpftTwGBb_VEb0zL3L1EPw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: starfive: use dynamic GPIO base allocation
To: Ali Tariq <alitariq45892@gmail.com>
Cc: hal.feng@starfivetech.com, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

Quoting Ali Tariq (2025-10-24 16:33:53)
> The JH7110 pinctrl driver currently sets a static GPIO base number from
> platform data:
>
>   sfp->gc.base = info->gc_base;
>
> Static base assignment is deprecated and results in the following warning:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.
>
> Set `sfp->gc.base = -1` to let the GPIO core dynamically allocate
> the base number. This removes the warning and aligns the driver
> with current GPIO guidelines.
>
> Tested on VisionFive 2 (JH7110 SoC).
>
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Changes in v2
>  - Remove unused gc_base field from struct jh7110_pinctrl_soc_info
>  - Drop unused JH7110_SYS_GC_BASE and JH7110_AON_GC_BASE defines
>  - Remove .gc_base assignments from jh7110_sys_pinctrl_info and jh7110_aon_pinctrl_info
>  - No functional change otherwise

Hi Ali,

Thanks for the detailed log of changes since v1. Just 2 comments:

1) The justification for why this is no longer needed should be in the commit
message, and not just in a random thread that will soon be forgotten.

2) Please don't send new revisions as replies. Start a new mail thread.

The code changes look good though, so once that is fixed you can add

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

/Emil

