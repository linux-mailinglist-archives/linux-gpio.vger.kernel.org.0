Return-Path: <linux-gpio+bounces-32699-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMo6ANpEq2nJbgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32699-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 22:19:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B15C227E36
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 22:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3916830CB5FD
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 21:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C032B981;
	Fri,  6 Mar 2026 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Miy2l5Yw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B63231842
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 21:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831848; cv=pass; b=EAn3HLWdh3uCgkmtLzhmwa4xr22B81pHeF6keFH6XyD731UItOIsSwfq2/wNjqBNuUgrHThdPfjy85lWS5F33dKhqYQGIezSd8YmlFZK4EzOy262jy+Yd9nWoZVjvKmgMBuoHNW/6cNVuy+BSRrSBXuJLNbVYbfvnEqHUxqcetw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831848; c=relaxed/simple;
	bh=xV+j6NHdrp5oM/A9ZIFLXQt2swBLQm+aDHDolhtd6Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqwmTyGOOz17rE+yBMo501dtPTYA3IA65LgZ/w33mRboAxPLY1N4K4JlGs5xjUJK0zDmrGyp9DCDN2zHDBiJ3VQqWCu39Vrz34BwLmr+NxlILEcPlRX65SHW7eTlmqGoSW2QqrjH/1NmlYVkYIdmtLYyxsJhGw9tUTHhoHwAlYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Miy2l5Yw; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6615c766e60so3396176a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 13:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772831844; cv=none;
        d=google.com; s=arc-20240605;
        b=QPzbRoBYHWzAtTzICKQf+iAlp0YzGOG06o6G6GZnAaGUmGHgWB+xkrKfcyBtx4yJFp
         qOYU0btyBnIpo8L114mC8oVvh2iYatZypfn6lawFoyheSDJCYZFd8QPX/QHswk0JlrhY
         Altautei8CmSQglLQQ3qLwUUP4RrYb8cKjfSAMI5n2b634RpwHLsq31Bu0T29l6bT7/m
         Le+L6ExXujSImocbOcynZjG+I7ussDvwlGY9lk541vhvf++BZFqpDw3+vSYVpz/WZIZG
         ynWwIHvhKTSs/PqFgSzany1xHbawWv8F00CbhOII1txA002kb38A/hoB2cZwN4K2L3vv
         YVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        fh=djarzYyMZG5QUjeRdlhZwtaKc/Yo2lKngzFmSycCW00=;
        b=P2m5TODokf+v2DxJJxIzi7NdKnJVuRmAVsv+uSx8WyvlQXC8kih0Np4ff9sgIudD+D
         b3/h9BniK8eepJETY9ZxnLKgXhdOcrfg/cpM0YGxwfbzl/PddB5TW0Cg1KyGA9ZDaNbd
         CEvETUHH7Krgj88cPIDid/+vreXcCO81QFibfy97AI1MPdulyVAWrEimRZB3o5kDhxbg
         lzJfQHQURYF1cObu7waixFibHjRzSXi8iPNjlzS6FTsXkLU1aRyzs7dTVz1VKkIw9TSf
         ykw2V711n9KmlnXmSL9yYJZHaAKctBDVJw1Ue9t1BrDQ3d4X1lH+22cUzkHHKHVLxt72
         r+Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772831844; x=1773436644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=Miy2l5Ywr0bstXjaUsgVwz68NheYRYqa2VBo91wKPoOEB/eWfI6sM1ZXAUVIBAGyNU
         nWrILuk/mCJGZyWyq/DE8Qct5cbuGUtuFKg4vx+NTlP+eTsDt/Z9O92EJlJFgR2+UU90
         OLMGUAprXwe3h4Dp6IGlXsgPvuPaM5PNp93jOHe5+i/7DmKeQ1TGeZcYCH83HT6B+D19
         e2kI0tsM5Md9zZPFQShd2pG0qaxG7nWofsVbbo5ZIQ8cupKL3KcvJkb5H/6Wv79942Af
         J/3A+I0kkJPl9mwrQGjoYr+kMDu3AyRCTx/BhXdyA97KOpecD6uHbKpaWjtKqk/GEgWR
         ckfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831844; x=1773436644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y14EKX3r2NZEaQlK0jcqQywAmjLktS244ugWnhJ7Cns=;
        b=o4NrKUkLHiU6xLtcn0U6yUMuhFTKxwrDfWcJ7RgsZYSzhpjDYvVdPkqmhholp+6JwB
         fhMdfDFKXvcKpBnMVbJhNi3/8YUJQV/IM/A74FG0pihHC3Darx3YbqlaWim0hDggNSHY
         rD9H9OpSHkbgoTXIZRpNcxs2hlZh9ZwhmUwE4/cUn++jB+6bMyw3M7/OHVh0SYcjOL96
         /+foegaaZHVoWZaaxfojyF4WnA0gn3+IZhj8D1pYTHBI/gVXgeBDsPU29XOTDpGFS1Kr
         L2CU8ffoPJb+xUBPbGrEMvWbxSUpEzRnp9ViAwyyNFhOcLjdQooY446KrFY2nSfLvRQp
         Hd7w==
X-Forwarded-Encrypted: i=1; AJvYcCXs3HTTgwZK3DMzOQonmRo4mjWxZUdJjOtxQbzdg29RBNQTQXryC3oLdmV3U2LUSBGkIWCD5tZvg+S1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZguCWE63FyCf6W0z1iJ2fl3bDjnbagctRGEzJw4JEkTaMKYVP
	Xrtde4CoT/1uaCoL7jBNoC7DYtp9EtQ93l/tklatqCTc9FC12Vv3wQwQ8EWrd7etu4CpCcneUBt
	BYSUW+jETvn5JHldPuBlywIa84g8eBMrQ7TLNKBoqxw==
X-Gm-Gg: ATEYQzwzAmW2OZCEc2fZymfsVECPmLHjb/YxlvdWOLPWCsTnGChJvN++lC7oXaEXvI6
	IAv0oob7HTc47feF0Lcv5s8MlJSkA7d1+qg0+pHpB+gXvMwXAwDwXyeipbHMw6KivCrFH9H5RxH
	io/m4gSDcxeG4eY4dY7vacVfzb/F3zDN3P5e4ZmV52GuTVjGTSZwVX5YXGrl5P/xAhlR8Ioc/g6
	AIRn5+uScLxzRh5Xq51EORu1MM/hVThFoDmZGaGrc1O+BhSalJuT01b8wZhMKbwYBHJF0oOkBjx
	uCKP6HPbc3OyBrxHSF8ExpBZLnJrUvZaV18ZaOuLmw==
X-Received: by 2002:a05:6402:5212:b0:658:3972:3a3d with SMTP id
 4fb4d7f45d1cf-6619d4e398bmr1927227a12.15.1772831843780; Fri, 06 Mar 2026
 13:17:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
 <20251202093613.852109-1-youngmin.nam@samsung.com> <20251202093613.852109-3-youngmin.nam@samsung.com>
In-Reply-To: <20251202093613.852109-3-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 21:17:11 +0000
X-Gm-Features: AaiRm53SUdPof_w4nrcD9oxrYObtPjzHD4ttJpdhJJCx0aq8VDLK-ZgvyeHdAs8
Message-ID: <CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, 
	ivo.ivanov.ivanov1@gmail.com, ryu.real@samsung.com, d7271.choe@samsung.com, 
	shin.son@samsung.com, jaewon02.kim@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6B15C227E36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32699-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linaro.org:dkim,linaro.org:email,samsung.com:email]
X-Rspamd-Action: no action

Hi Youngmin,

On Tue, 2 Dec 2025 at 09:30, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> This patch corrects wrong pin bank table definitions for 4 SoCs based on
> their TRMs.
>
> Exynos2200
> - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
>   'bank_type_off' layout (.fld_width = {4,1,2,2,2,2}).
> - Per the SoC TRM these banks must use the 'alive' layout
>   (.fld_width = {4,1,4,4}).
> - Switch them to EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
>
> Exynos7885
> - etc0, etc1: update bank type to match the SoC TRM.
> - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingly.
>
> Exynos8890
> - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
>   a non-external interrupt bank.
> - gpi1, gpi2: update bank type to match the SoC TRM.
>   exynos8895_bank_type_off (.fld_width = {4,1,2,3,2,2}) ->
>   exynos5433_bank_type_off (.fld_width = {4,1,2,4,2,2})
> - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> - apply lower case style for hex numbers.
>
> Exynos8895
> - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
>   change EINTW -> EINTN. (The bank_type itself was correct and is kept
>   unchanged.)
> - apply lower case style for hex numbers.
>
> This aligns the pin-bank tables with the documented bitfield layouts and
> wakeup domains. No DT/ABI change.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This patch contains some worthwhile fixes for multiple Exynos SoCs. Do
you plan to re-send it? I think it would be good to get this merged
(even if there isn't broad agreement around renaming the pinctrl
macros to EXYNOS9_)

Thanks,

Peter

