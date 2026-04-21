Return-Path: <linux-gpio+bounces-35294-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOBGONJE52ls6AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35294-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:35:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A84438EE0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CD2303AB61
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B375A3AB28F;
	Tue, 21 Apr 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAt/U0rn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215F337BB8
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763950; cv=none; b=Vb+jEVdUwLiyGiWINCdR1l2NJqqNlsCkybkZzPeTDnaixhnxqBSktaC6BmojJBNf/hE172MIJAL6OML0SYrSNYKe+tRJbVVecvVNpW0Z/pd3nhy4vb3w59JR3tQBi5DZ8qOTmCRv6wnxvceuBaVDU1k0brciu193iCn9cVwRdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763950; c=relaxed/simple;
	bh=RIJ5ZndJvGd6ssreqo5at9CUOsJVsflPdB1Jiq4Nklw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXvccLPSChehxvsSJzaZ16wx36Ycqs+txUnniwdAEpXVUrN+dBExFXdGfWmnFK2nVzqV0Q9tdzsb9RuLJSyfuMM8GCjj5LwCayeCqdG3BbRVWm4IfdHFsyAavyVhpx2D9BI12xF1ubjjmt8bxsk3uKXzq+1ZVNY/RhjxEEljarI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAt/U0rn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d43e09de5so2203593f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776763945; x=1777368745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I1BwtVt8bKFpbQGVlkdldux3RDIWFxamHAEC+xVHx6I=;
        b=lAt/U0rnJgAbgnlRam/V9PG98qwM3f0UR/1t9YiViLWfmxjlFXO6JdqU3BHTRULD+k
         PsvC9HOkoEZBUuGsI7kNqmjLqdm5eeho2m0aMZRSqZSIhVNCMWtSaZVm0b5zs9V2FBpW
         V64h7aRtwjsEemRNNHE8sfBmTuee3ovD7gxSuDkfIB+vrkS5ufOuqWGUDxLBYweFiV61
         hX6qxuVL2jprptBYNrS3QHIy52TjFbhWdh9VFR9AOM4rhGK2PsexyYJ5XWfDBkAk9+MB
         8QEaGEYHEWDDeev0v7sra+FuCVQyeuKfrONL5ZsjcZVJWiPiZmcAdfVMJr18aUsEWEK8
         2Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763945; x=1777368745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1BwtVt8bKFpbQGVlkdldux3RDIWFxamHAEC+xVHx6I=;
        b=ML6t/nX/ZtrnG6swT0FY6R9E4nrVEqL7o7FyvfDG05ZGboTJ6P5qdqUR6U1pwmmZmd
         rGGPDgltxFTK3L2xDlzsLJH/mHmELS/UC2jmFZiHNq+7SyZYjg8mp3QHtBwG5uZhki5c
         s/2M5ddpOgoHXlL9M9xyXKNCkcD/yZznpWHzpwcYM1VIfNnDnXvJc4UwtJ4M56XlpjVg
         aIG9XV31WuSQOV4tz1teMlFGvn2t9iX4Aakgy9pHAniebTafNytR57/M2y4D0Q42Dn6M
         jmKF/Mp7vr9auCtuGf927xzUVAy5sLJnbsmQztbM/N3XeY01xZU7gukLAPjMb+fN6FTK
         47+A==
X-Forwarded-Encrypted: i=1; AFNElJ+bHPNDeqe3cg5Ih78NJvLJ1wWy33iqOumetTBIKfqJdblygaleIMW7SwrqMZmJTHy/pc4wKs3lvjLk@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHrJDAklwameNhKsmO3n5rD8LUSoOsvvha1KtNtyrWTq0W0vI
	qOSeUaCD/UK6oQcAN4LXNIydSqNSP/LNJpeLvoasYCPK9ok//X/H8yct
X-Gm-Gg: AeBDieuqlcf1EFO0tlqi3Z+YVT2T+2ciJT8WQVW/VmUBAw/k3DugDOEyH5i/4IojLio
	5gxrzmer3Cmg44bSfooF3ZCIeD2oRZ4NY04CR5jJQDej8e+RDEdKkiNYAGHuMp4yOweTXyTjx/a
	Mx8rRSGing/1/WM3tVn7J5O5faJh+VBBLCjue7N7QHytoVtkToRat2oEWuisdt7tVVOwdPYCGgS
	OfMEEoX5a2PhoDKiUHkH+mZM0kxpm2atPuV4cJRA7YdKcbToayBMj9yQyfCQ1GiBlX8/p2AWVhp
	/RPBcwqv/VCv/tk1KdPvIp62Q7921hALO1vcTzSeev5S9o3clMXiWVvuIRDvEW55zUKGYtGlO6Q
	zvOBKDRKYLOn2UGdC3Y7ku+jP8OGWdukBPJ2i/AtW8B8aYdfeFIX2Kwg/oz0PkCddlUUv4sg7ip
	80SMHRlCmClWtQQtnJoEQOfDxq678zdmS0z6sxUQAPvu3YytjoUomyJiN1y1uAixh5XyA5jCb+b
	9f7rARMC0Xgyg1HJjh3GTQG5fA6QZ8fWuQ=
X-Received: by 2002:a05:6000:2303:b0:43d:73d4:b34 with SMTP id ffacd0b85a97d-43fe3dcb1e9mr27481040f8f.16.1776763945123;
        Tue, 21 Apr 2026 02:32:25 -0700 (PDT)
Received: from orome (p200300e41f131500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f13:1500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm36932206f8f.2.2026.04.21.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 02:32:22 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:32:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: pshete@nvidia.com, linusw@kernel.org, thierry.reding@kernel.org, 
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	webgeek1234@gmail.com, rosenp@gmail.com, linux-tegra@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <aedDEkawf3cYxQm5@orome>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260420100601.343707-1-pshete@nvidia.com>
 <20260420100601.343707-3-pshete@nvidia.com>
 <20260421-spotted-trout-of-satiation-1dab00@quoll>
 <11de368c-960d-441f-a0e2-574de444fd1d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4sxaixc2gc3gnn6"
Content-Disposition: inline
In-Reply-To: <11de368c-960d-441f-a0e2-574de444fd1d@kernel.org>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35294-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: B3A84438EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--j4sxaixc2gc3gnn6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 10:37:46AM +0200, Krzysztof Kozlowski wrote:
> On 21/04/2026 10:31, Krzysztof Kozlowski wrote:
> > On Mon, Apr 20, 2026 at 10:05:57AM +0000, pshete@nvidia.com wrote:
> >> From: Prathamesh Shete <pshete@nvidia.com>
> >>
> >> Tegra238 contains two pin controllers. Document their
> >> compatible strings and describe the list of pins and
> >> functions that they provide.
> >=20
> > Please wrap code according to the preferred limit expressed in Kernel
> > coding style (checkpatch is not a coding style description, but only a
> > tool).  However don't wrap blindly (see Kernel coding style).
>=20
> Heh,
> wrong
> template :(.

No worries. We all make mistakes. =3DP

Thierry

--j4sxaixc2gc3gnn6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnnRBUACgkQ3SOs138+
s6FyFw//QdJRT9MF2TxHiVVlcS8hnaW+gsVzqB1O8v2vGMWbE8mYQqB9Z//Iq7bC
K0ZZGbJvFaWBUKW89uZc5rb0NtOYkm2BXG8PGUUCS2mV7s4qZuwxcMrAshCjJxwa
2zvkjg8lHWkPEvT11VqNOLZbvrP3DknG1yWVW4GIq8gaETMFIiuq6XCSUzCCjOBr
FdUMRpLM432GU4qHsGOWSELCX0V/FaoNXDagvhlzrQW1ok/I2zvabuGLE57WDTyB
QbovjvwijC0+OCfl0C2qAj1CtLNI+cWQ9Swi7BUTaTx6MNXHXpCQbD9o/8Qu2Ogj
//hIp+0GPySfAPFNOZmU9mKpvY+HzUAvQvExd36z87EW7yR5CRrv2vwaS5W2hRus
RGTkWn9AbkRlM7lnrOsXFqMmjqeOF16hXrOZJqYkHxVoGRHFAg1rA8hKEpe8dQO4
zmVGojcuWj4nAoQGKr2ntQrQ67dXx68BCMG9ljz7pZXAXvghmbI7cxy+B0M5gGq3
bQY7tNxgrjy0tOjxk5Dtkv6AoiWCSDdSUntgaw0Nvi+5Dss42vs2CBVXseCcOmCe
TR5M6cj7J6S90kWPot1Xrfn2GWqq+7iCYaXWb+DGMUyCDzMEQ25yhS6rSCzmR8OB
GzxxL62sHXOCYacjkupe9fzyUWHdUE8pRqGsR4byfJ7N4NJ4pok=
=Psrd
-----END PGP SIGNATURE-----

--j4sxaixc2gc3gnn6--

