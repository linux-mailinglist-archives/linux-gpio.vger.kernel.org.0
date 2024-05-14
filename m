Return-Path: <linux-gpio+bounces-6348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF598C4BF9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 07:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1868A282383
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 05:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D032818026;
	Tue, 14 May 2024 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRdMWvsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F8614A96;
	Tue, 14 May 2024 05:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715664415; cv=none; b=K55dv0beUTx1a8Lhj5HnA2+WGZ4BrZM9UTwE0NlgweMRGSuCJVc5OXf6y9iYGKD2p4M5DjA8Uf8pDBz0aTeLC+hohIIR/Jhb5Y1lZ3IUTbJDxlzIrceESoA367RvTa9r2BX+9gKO2kMC6Dhnooen4WtxAUhub/SAIIMt0b5Lg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715664415; c=relaxed/simple;
	bh=Jq8OjoVu3xwkmJtrdu7jX+SZO8MO/9NEOuV6wtqdUlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVU5xwaHdw4bdiAP7rGMXUJgIzRUrwXaCzxBjTCgfKjpBPgzFdAC5B4fHmbF8V5X5QzVJLDdnzcotbulqCb4isiDLjZvaiJzYmWiv8TTqOcAW+twiy4HtdIOR1Zb/Nd8kiS2zHmnHYWiv9FnbZoAvoUQNyOhJq4KALJkRPTfzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRdMWvsV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ed012c1afbso41628285ad.1;
        Mon, 13 May 2024 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715664413; x=1716269213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq8OjoVu3xwkmJtrdu7jX+SZO8MO/9NEOuV6wtqdUlI=;
        b=fRdMWvsVRgXlOYv3K4fo3WOQK8oBzaGff/M826GDoyRmV3jbcdlZKmlnIhuxKASR8s
         eZt4qKIE1xiZHvnkpbfC4meY7dRTXj8BFcWvXds4hA2aee+T0UoOP33Xfd2j0U68bz4R
         vmSqMsV9fUwitH9tTweF+gDfsam/mtlNUg0465+yQghNvSJXKXrirJJFbndK4aYgu6At
         jOrZXwiUSWgihXAV42SOCpJ0TRUXFHEWZMI6+R8HE1+8KB/cPS5Jaq7pTgFj94LIqMYR
         D8NpewYE4SDzNd6tSpUHmhY+Bb7Pi8j8ULTaIujE9/Vbq6Mlp09wvbjNz/gm6OhJg+pn
         2iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715664413; x=1716269213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq8OjoVu3xwkmJtrdu7jX+SZO8MO/9NEOuV6wtqdUlI=;
        b=p8/q1jKY5154khIx1euxvJN4I/GBHkQ8JnGqOwj5pafdW8N7ZnKM1y4X99XftiM/33
         jNtKgcTCPmY8Ls8JTgQLBsQJDXKEDwYF3xPhEGixOLO15uI711IPmkZt376RcHej7MsY
         ZcyTsSygcrs5z2jqsZX2xgE64ln3LO7/iCibuyRphYley1lM0s7r9Al6zfvHUist3fjZ
         fid71NhYMqDPSDnSu1DLZOD53vXJ80GUzU9E4/wXpDuVokdkLQahuKvLwVntSmlOhRPg
         2C3nVo0zqVR1nMD6o2t4ZbvW2oMpMb541s/msIhqGSh70ji2vZkGE8naD4K2RTJ/8zuy
         z43g==
X-Forwarded-Encrypted: i=1; AJvYcCXRu8kczkVMdoeM15t+Is24iy/rZpdUasu0aRmLUA4NzUe8cfW0duBwUEgfiF0Ef7WNDEj7vk788nJlVuoaVy8fEQXSD8GHpn8RXnQDO+QiD7QlieJXDD0z5QwcVwMHeapfg0UMqdgzSKO6c3KbJfDr+mGmIiLN6gvr6Tjg2HxrQUCmPg==
X-Gm-Message-State: AOJu0YxjTak6c8EIf9yXK30E5QdnHnTqzTe/djJ6NR4wIypfX74urRH+
	lLX6bsRd0gnJkGskNuY/K2eOM04qdx9V+6QHbQbD97x1GIL8qPN4sG8frg==
X-Google-Smtp-Source: AGHT+IH0o6lLOoPznD44gBWTySwMpvv83A4K4CTMxIQPkMFfM3pFrenE2vDc2FB9w9bsIhs5oMmVOw==
X-Received: by 2002:a17:903:1c2:b0:1e0:a2cf:62e8 with SMTP id d9443c01a7336-1eefa03a41cmr226226425ad.10.1715664413477;
        Mon, 13 May 2024 22:26:53 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31229sm88291695ad.138.2024.05.13.22.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 22:26:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3F34F181C8F95; Tue, 14 May 2024 12:26:50 +0700 (WIB)
Date: Tue, 14 May 2024 12:26:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Huichun Feng <foxhoundsk.tw@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mao Zhu <zhumao001@208suo.com>, Ran Sun <sunran001@208suo.com>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	Shaomin Deng <dengshaomin@cdjrlc.com>,
	Charles Han <hanchunchao@inspur.com>,
	Attreyee M <tintinm2017@gmail.com>, LihaSika <lihasika@gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
Message-ID: <ZkL2GkCsyKYRckj7@archie.me>
References: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tApy7N8s/kQ5ZoLI"
Content-Disposition: inline
In-Reply-To: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>


--tApy7N8s/kQ5ZoLI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 12:12:23PM +0800, Huichun Feng wrote:
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>=20
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>=20
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--tApy7N8s/kQ5ZoLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkL2GQAKCRD2uYlJVVFO
owkxAP4+j0XIuZjzer3KEU2hBpV2m/fGG4rwaXE66ovkHGdkEQEA6k+r0sif9hPK
fSFs0eCsgOkyXQfo0mfLntsTJh9lVA8=
=0QDZ
-----END PGP SIGNATURE-----

--tApy7N8s/kQ5ZoLI--

