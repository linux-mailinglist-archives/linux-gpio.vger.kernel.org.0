Return-Path: <linux-gpio+bounces-19452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD32AA0D54
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 15:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E893A188FB6C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 13:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DDB2D0260;
	Tue, 29 Apr 2025 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="USF1+qqD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA62C179C
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932670; cv=none; b=QwLk64ebyBaJ+W93OhtRwkHOkZt4rLff1qbfqziR/H6I7CQ9b+8cinYEDuQkx3uMl5ikHD7vZZ2t67HwiDo34RrNnmBkrtNetgLuD3HaiF+Pm3mUHi7vRSWRzHzEAEeKZ5UExCHk19m/NATUvg4oJqOn0IF2cG4N5AkaB17caJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932670; c=relaxed/simple;
	bh=R3HOfhuh4Z/yau6P4o09NM2xwO65jdSQzwa46LoRqpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpoozIbTVoZAnFf9SuJBtMiN3ARcro1TEe66FBGW4lJG47IYqYjVhiFdjZwDHNX7BPnmzFONfQWXPjkyKxgNWgyarsZchhtA0MowHgGSoz4UP43ChQ7l8649HL7/ZaqGStiCODs00e25Oo1gqu6ZxERRPTXc1K/HLhH+hPbB1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=USF1+qqD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70842dc27easo53861447b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1745932668; x=1746537468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiU0ctgy7Lku6IPSealurIvtPQsS8cdAkog6qNamfp4=;
        b=USF1+qqDnxgaV+JunfwDta5K4//84DptMR0utZMV8Zi/e7BrwN/vtP9F236HzeIGmN
         TQbzjQz+VT2nyZ2Da5bo/RJjDC40M4Wnv/6MsXXNjZzCCsF1LiHbImFSJ0FHeZMg91Z+
         mp7pJdsf2mEM4gsMYYBHqa9Oo1rl/NFDOs7Vqttex/5ragcvX0WmgwUC9mYFScQKRWBZ
         8E3k3y53jhcq9MPM/tmz3u5t4n+0e1JvZqJlUTeei9CFRpaZUOTGt/5jEd3YxYT4Cay9
         EbmfWlGwc5xtbR10KoWUrCSizCq+em4tKKblOctsgoyKFTSvvWjl4tkGfjxpg3knmD3l
         ka4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932668; x=1746537468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiU0ctgy7Lku6IPSealurIvtPQsS8cdAkog6qNamfp4=;
        b=eZjavfz5w0uwRONi3Dcn9CSYFXy7ADIKFQ7Z6pRau+ppiNdQdBgvy7KYYuYnAg23xE
         jRuz5Q5l0btdGYN4jKn6aPQxq2WCSjdjYTUiffGSyp/ShppaCPq852Y1BG0w/Tw6DwFe
         PxoErxg8HaBonNYmGu/kmNbdrq7diU65rU4QTdCK3jRi66U3fnOx7D2oTI02CqVWcnBe
         lxUp/HhcRcsNUPzyJGRjLy1DD4P1jc+KOSW5mbJT2vG7MzthO31gxvWFFXnyV1LcSn6I
         NjXCaYWP0Qrh144Ma/nVh27F5yr5iNSr+b2FCaQEhhoRaca/mbAhVefLo2YtJC3hqGdC
         CxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMa9gmJ9pcw09Iod0C4OaOPcioz2iP+Or9GiNt4kNOcb+S6Somyi0NK2bq+S4QI8FTrsNksZyAvSaP@vger.kernel.org
X-Gm-Message-State: AOJu0YyXd75yIxc2ucNlN8ah8p1VURcWenH34kjKJf/LAbeYYbpkBLfs
	LEf8Sdivo/eHBBq1BjZ4JiYYyQhmR74H8F7TB4pZgLewhYVUP1juFsumL5cebUIP2AOxkyPjomc
	l2HHPgpkfsn/hsz5LtLUmossB2o+bis59VQrF
X-Gm-Gg: ASbGncsfCxXR+w1SFz3mk7WNzn3nlzSznzL1yCT8cYo7FJwD3+LIOoC9bJv7uZBD5HJ
	RrLW8nwCSfEAajsgySFYB4TTW6GK2eSpbI4KubB3hj48y6L7pdFAizN8c1KSZtp4OkEfV9nW8Pm
	HUET4lCAMxkBqz9ZuHr6x7
X-Google-Smtp-Source: AGHT+IFAkL63cTl/cATNWOg2+YEvpMmi4OYjf4KFpNJEBRA716QUIF33QsNLmMAkg+zJVxgzGQkTVCNVAoMlrQh1Ycg=
X-Received: by 2002:a05:690c:6888:b0:6fd:a226:fb24 with SMTP id
 00721157ae682-7085f1773b5mr194962727b3.10.1745932667944; Tue, 29 Apr 2025
 06:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203315.71497-1-s-ramamoorthy@ti.com> <20250425203315.71497-4-s-ramamoorthy@ti.com>
 <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
In-Reply-To: <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Tue, 29 Apr 2025 09:17:36 -0400
X-Gm-Features: ATxdqUG2F7x0DRZn5itS7I9rvm7sd9uKgUWiZxhm2pdUZyNe5KbRtX9ZG_d-XUs
Message-ID: <CADL8D3YY+EYPBX+Unt=zbCCLT1-qaCmOmF5VwG1qOK7v_yFzoA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, 
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, jsava@criticallink.com, 
	Praneeth Bajjuri <praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:41=E2=80=AFPM Jonathan Cormier
<jcormier@criticallink.com> wrote:
>

>
> Note: Its unclear to me, why Jerome Neanne and I weren't included in
> this patch set, considering we were the ones who authored and submitted
> this driver.

I see Jerome's email is dead. So that's one mystery solved.



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

