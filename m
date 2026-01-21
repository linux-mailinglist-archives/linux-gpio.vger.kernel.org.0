Return-Path: <linux-gpio+bounces-30875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBcFMFMXcWmodQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 19:13:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438B5B1D6
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 19:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6F1867024D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 16:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBEA413242;
	Wed, 21 Jan 2026 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W73yuWDO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1987D40FD87
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 16:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011502; cv=pass; b=etTCEHhTe5MBVWQCGaI/BwwJfqfkJwWuhQsNcLJm5gGDFvyEhX2W6Yw8YkDqTNYq0tWZ4xEDGhCx/39WYLuV/GqBERxhSrEe2CR28lt4MKm8Rn9Htc2B8WzlTT7fBkKM9pgaVRShSAluydEKKMQfTrwDxu57EkNrCVDj8exnoGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011502; c=relaxed/simple;
	bh=9WOiqQLpe14jHkn1GS7iuJPEZv0ij0GieIC49FmEKNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcm4vls6RyDSY7q7mVMhtXAvcwktlPJYMfVqqIOXcNqAR2ZlKmchHQOJz5FwiGwAyEIVj8ZUl1/DHSRxmRXMjlp4VU+66JwMku8LzDmGhDH/jcwPknFDa3tB6QC5DvObhn/+S4zoVEDEidlmG239XntIDZ7Oxf3CdXsUkdAEvLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W73yuWDO; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38319cbc8fbso89741fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 08:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769011499; cv=none;
        d=google.com; s=arc-20240605;
        b=GZV94Yuu17xNJHvTV6nDngghrVMjSJqUCMr0adC4nlKYXPTeNhQ/ittHYwcfR8JQrJ
         RGwSHDacYb+oTorM+poz/vxrktEGlGrdP4hJu6+1ddV6sdp5q77jmpCnZlAZ6rHz9nIc
         J+zi+keEsyIPxFvdL2TdMgi3pbDZA3zAZRhXWN3Z+QHoKpzJ6ceJp5Rufs7E7DBA6T+K
         AqCSnctngXL+xHI1Bes8iFPo71rtggWddED08nmhG16f8z1ma3zJk71nuA2LXpVNv1Ls
         I4/EHhKH6/fvxbLSuvWOIpjLSx3nQS79xA5P4tWAHtZ0CmeGpi4UZScYp6Dz3n6ci8Ld
         7ORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        fh=t0UEDhLUHijTiYLs1JqoQMT+8ta9DKYHPHpUb/qgxFo=;
        b=JcK7JXbeU/OQqe30copRsyu6T6AimxXe0G0i03wmiEQg0NDVN9KW/Qj/yU+5C9ctBE
         0MVoWCIUe7SImLzrKBd95C92mKW8drTEPAK1g4o+lEVIkyipFrf3t2XJ+X19BbhvlTsY
         CWRUxwYYq4LkroqSGJ9vt2YzdczctotsdJcSxDuSxvjeFmCOtwdj7/cpMwkV3+OjEydf
         Jj8/kUCz+yl7rQ7lRGXuAnE+4bDd8rvIeJW++c1skV4IbGFpWO/9skFzXugDP+/kYbeK
         c3u8s45Xkl62n0jWyk4yika1L7CgH4j+a+8JxNbN6NAxPnznhKJMV4XD5Vl39ZW0qHzs
         Tdug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769011499; x=1769616299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=W73yuWDOOPObMnVkMxvLUKV5TeRNPXQxNk6sAc1LvxTQWIsf1faBuyzmQBXkyE394E
         /NreU2gaI41H2xeapc43zaDcUn4D1P4buglWtPR3lhxOIQCgK45sk4+Ds6Wz9IyN3nTF
         oJW5ryKBhcijHnVTL4c6cZVvpwwy2iyB4KsF9olcXWqqp9uwJiY9BSJhKJspJoNSI3h8
         //EzVvRh9RmOVC/jhdiP09hwu53tYc7P4A3XfW7wucO6O7jGkeJsXcwzsXdZVd8KT2qT
         z2+A2UXMRl8lQbb6govm//MUeXjNpdA6G77y68ubQGjr/01gtG2Y5IKfQ2tneM0xbxmB
         ICgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011499; x=1769616299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRe4h42gYYt55oqZ0VJMAxvd6IK2mO4/T1aM6Skm7C0=;
        b=FzWFcUNBd0GT89C2ZgnkWWHDWtY2lbjetncZdb1tU2dhRr5Y9AmeEWFqBx6EfLzMtw
         yfEHgV4enOxOfo7wDYAgEyjDzLSPtbQ0CNZO5kqmPx7s3ZY0gLW5jGCYZjHDqjvYafEy
         WTKL0YLuobBzB7zsB7bh4qD4wsOdfnAJQ1yISW9Kvt/bhDN5eH4XVhk7AK+pebS5GjH0
         SIedx7+NvkfYHNsef5mqeKx8qlxs7MVCz6cNGPrK1RoLpM4CNO9tCUisI1J14ZkNWPHg
         RduDZ0RGjCoiDwb3NKhvyLrRI7e3vFVEMPzmMN3mt58TwQV53wgHrc9C3+ya7Kv1HIDK
         iLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1m6BKFN+cRZEf/NTG2V/b1z7g7hJt9Vi2hzRnexkpw43ZHHnBnJY28+y44bKq+J4kySlNJBJoPmqw@vger.kernel.org
X-Gm-Message-State: AOJu0YwvegjVrrZaSPe3pyXjTTYwTuPpeoKMslXZ8czOo6B2TkgyHcfx
	jhxHOUcXTjoSWz1NP7iQLn7Jd7/9uysgoyzztDdxY7TJswRAXOQIFvdm/F9ZC3tltu5O1dBkHv4
	xQn9QGsePrG8+w0iGAKpMqri1RJTVDbk=
X-Gm-Gg: AZuq6aIe7LtyCJIoOVxH5YhV3rvXbiLbsLa3PB8MMCi5FARPXKo/51umW+hBiQ1kvxA
	pHDC+kv82VK49lBqQdNtTDYx5tJIuellVBG07EGLEUSNNao6v5Ft3gBKweBct0awQ8aqiAkmv3R
	C/nyB+oHZMxxSpJfzV0FXQQm0LqgUrlBLoOu6KrkOWiVv+X2qfgnvMidJI7ze7Ki1nz0djCC7KR
	hg2I/NwAnw8hyhfCuUK6KsdvzV/doVbOhLtT7ZEzWtfVljdhaOUr3jKCbbUW4YjxDiJ2T5Wz5DK
	lUFKy60WJjjWYkPNpfhksXb/
X-Received: by 2002:a05:651c:50b:b0:378:e079:ecdb with SMTP id
 38308e7fff4ca-38386a5a857mr68389931fa.32.1769011498915; Wed, 21 Jan 2026
 08:04:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121142047.10887-1-shawnguo@kernel.org>
In-Reply-To: <20260121142047.10887-1-shawnguo@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Jan 2026 13:04:47 -0300
X-Gm-Features: AZwV_Qho2JYpTZVHBYp5J2gwGqRpZGN_LJftzAyI3mmmYjQYuMr8IbSZPCWO69s
Message-ID: <CAOMZO5B7Xp0jXcxmD6zJeT2Q8QV_AiQhC-e3_q2viKNsek09+A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
To: Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-30875-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3438B5B1D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shawn,

On Wed, Jan 21, 2026 at 11:20=E2=80=AFAM Shawn Guo <shawnguo@kernel.org> wr=
ote:
>
> Shawn is no longer interested in maintaining i.MX platform, and would lik=
e
> to step down.  On the other hand, Frank seems to be the best successor
> for this role.
>
>  - He has been one of the most outstanding contributors to i.MX platform
>    in the recent years.
>
>  - He has been actively working as a co-maintainer reviewing i.MX
>    patches and keep the platform support in good shape.
>
>  - He works for NXP and could be the bridge and coordinator between
>    NXP internal developers and community contributors.
>
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>

Thanks a lot for your great work over the years!

Thanks to Frank for volunteering to become the new i.MX maintainer:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

