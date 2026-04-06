Return-Path: <linux-gpio+bounces-34721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJTOBzUK1Gk1qQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 21:32:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE563A6A2E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 21:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DC8530214C8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 19:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FF2396B69;
	Mon,  6 Apr 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA3kyBNH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF49386435
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503922; cv=pass; b=Z4+SC4QWr/0iHlJmaJJlJq59xVdJ49B6K8SuqDriWMniSQK62IJJ2aRh4ayKOJC+1UWy1Pa3jYW8Rvxb4lqN306JTw6A/p4ezjfJb/NdSBsQgiSo5N/N6KDxLa5EyDzqkpE4zQVeHJBFEL04kTFWn3vb6oXTcfPVP8mlqmat/w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503922; c=relaxed/simple;
	bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOvThVpup2mwtEuVoQxA3JSlSMk3ygV3FOe8omfFfxYfv764XaAhy0YHMA5bHqSl0L0UUHCTlNTC9hdLp1dixpHpJZisBgHTYPahvrZQndCFi8skQGrWZhG9AapxrpneQhXn7QODgV9tJFejlDFMKVvHLWYtgj/Z5WT1rdVUsH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA3kyBNH; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c745e18a0so650136166b.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Apr 2026 12:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503919; cv=none;
        d=google.com; s=arc-20240605;
        b=WBKYwzbseP4Mb7A9N+9tf+8NSWOJ8vJVeDWC32klPU/KVLS7hWahW5dGEvzusXpHFU
         STBatFBzJI0L5pX+UBI6LCCuYLzSoOWuMBdJ2qZsDjsHA7Pa5O1mb5HDJhW9rB2HRyDM
         qCd2Xag0AuMpZwhuZgzmIVNnOPllj46GEMVob0zeHT2ruKuQbcHa6oef/TTr24eHsKQu
         h27yPJCfKnRwCorf0S5LCNaxeUJjO6cvaxLbDOWBFgMqSVjnhxQtwqdqG+p+mz1j2hGb
         DCM1bvo3FLaZQiyFixjd5ZjfbdttPGdodJ5LzzSArHOAfEEpSBqM7lRWkUjKOUOIGH9F
         xueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        fh=iNywQAUF6W/hkw2MFAtrgQtJPFahQW7bXCWeTfg/KTk=;
        b=R73LKq7SL3dlTnSu0Ot0GWNJIXVDiaRVGCaTSzj33Oqvs0+dH4/ww1U7VZ6EeFwx76
         y9oyj9tYp+rdgNZ9yK0nUQF7edpcabtrgKkXITIGkLd10sOp58qN3ijMXfvrvU3qNLlH
         0HRVcmnWI/wkza9+CvP/wrz9wU9emufN/x8ZW83KwbxmPHXf89CdNCQ/IdRe2mmZCatd
         T+XYkbQ4W7vnOxEBOsr2WIpqp8BJFMoG+EIA5GWIToEKqdl6hG5a2WJ/A/jJPQ+2Evuv
         bU+oFCX+A2H+B+B7n/OiNjnjRw+c88FbRjdSdGMVAEiNO+wBy1wISuZ7ABreR8V5HtCA
         Qgpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503919; x=1776108719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=dA3kyBNHclM4Ez/APobjWKyaK3W5bJL4bLOsg4CRJ76I7AcKq38GlG29bWbM/U5+PH
         APWM+YSeNP6h0WNdexoK9v5az1CaQ482iGJy4iHliQQAqHo//7VefoFUyB1Bqce124N/
         Na14l5xU7kBReh1xhamoAkNqBq4H6sg9QhNrSb+84Q6FbE/lhgAD60Jt2JVr4g5jDtNU
         bx6hL8fJmfRYOi3kSIWOL9d8MgO4IuDftSvF4gUCXobV8XnWZVpwLFmltr4WpF4C1qzd
         ei5oXE8Cq5GKQSK08C5sz54J6fEZlD5Z3VM/zp+93WbQp0RkcMItGmPUkWnK29NZ2dhP
         xUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503919; x=1776108719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=fdUoDARnDn/koutCGDbcg8UN10ozjiWD3pFGKjPJfMybmUtxYEC543JpUZSAGyLFgF
         r2FHkoVYtN7WlnXamYS0nbZwH87PvUfCVMBArOnQpU7ZMJ6u4p7+ms5LZgU7ARiL6AiP
         Ngx0JtD+q6Vc4HHg5679MvUu8ShY5qu9WZzUt4lcCmvLTSVFGYNt6KZULuP2OfqwTkry
         hqjiT9fn8ZSIaxJaHfbT0e3IbXZ1iO8Hkghz+vO5CWJfaAjXvp9YDCAg6uAwzICwbTxf
         f9Js2pHCBhe2Ar6YPsB1VXMI5UM/LbYry4dsAdGs0Gs9qrspBSb2Hq2uYyKOmOE5i4D4
         DM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1yihFgS1nnb2+2QBTrvtAjvPvDHcDzQcRIa2EYGdLSoh1zrMd+7hkPMgNoUPfqNMup3BUUf9g2Oan@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zKJ/eONfoX0iM7jwnnS6v0E9vpqIh+0o3d7S4VoEZIyXnPY/
	1rHDmRKZ0N0tP19SLObBxrq/6T1e1PvRQ1HGfKshm/gN6atH7/ujQXgVJOf5Udh2O06VhdysKAR
	cqwr2AjQqS056w/HSQ6g8ammzx5lw8do=
X-Gm-Gg: AeBDievNWWQHWIGxHK7OlRMO4hAP+iJBS2NjlMaQ/7XgYbHxI6E+ZSBoJtggixdJ1ZW
	v8EGYTporfYxagC5Dlge++8Rlt0ZEDWl6V2k9qW+G1C+9J5vhAENwM34GkOmdfTzUcbMMCOMlVc
	3JKcGPaSG1N0DWOHeosE4HCw8B+0pU/dO+aGhQCFRhYrfifV+RBvTUTjEXdkL4phm2GIBmIxtM4
	b/Q5MtYZ7h1CHZ8JtEJbAGLL4Hgd3NTt4v6XM58wT2ISDA/bKOn0HSDSBW03TdyMskG4XnSPZwZ
	cO78eBx56VnaogQ4oHydzUymoJtKSKeUbmol3z0gwVg00oM/vkcsVSEZcL+AlPe6wUbRwzMUvZS
	lK459Uwk=
X-Received: by 2002:a17:907:9407:b0:b90:b959:4c72 with SMTP id
 a640c23a62f3a-b9c65596656mr612539466b.6.1775503918392; Mon, 06 Apr 2026
 12:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:31:22 +0300
X-Gm-Features: AQROBzDF6KYTnuyhLB-pMUEmLRfSC888lHdfiDN5w1084rUmzr9JPBFEahloXWo
Message-ID: <CAHp75Vd7cs8tF1vRVFNmXsO0X-cgTJ_Ua22+KigdsN8Kpf-Tyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34721-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8AE563A6A2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
>
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use
> -ENOTCONN to indicate the software node is "not connected".

Despite being mostly for networking purposes this error code also be
de facto used in other contexts similar to what we have.
Acked-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

