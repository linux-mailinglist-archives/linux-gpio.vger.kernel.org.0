Return-Path: <linux-gpio+bounces-35819-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA0ZCr6+8mlbtwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35819-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 04:30:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9D49C5B4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 04:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E88303CC25
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 02:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030E282F26;
	Thu, 30 Apr 2026 02:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDr3Otgy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618F28851C
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515934; cv=pass; b=Q8+Ng4OBA/DHEDQGL2JcPXa/tlVv5kCPyCsjUirocsreFGRel/4ydvzoZnvHOkDEGsiRFoq4p2dnVJVUCNVGNKhCt3eND5lf+fOmW92P9KSS9eXVSPKtzmNSghoFbhviknCiZ9u8J4Fz5Iw3ihNjsL4o+ylP1X1EbhKwBAZT084=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515934; c=relaxed/simple;
	bh=bJYmkglzyeOv0nGF+mT7H184CwNBVGkoxucS/uxRQbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8IyuHCOvTb6jzxtLyvoqVzRLWrAOQ6wLSlSUBO+1B4jSQMmWG9kd7escjHUmQti5ipkg3KyxwqLis91eQtN5pATNJeUL86o3l+qqMkig8jGoWANjyU4XDULX+oOWcdAZwHDObFdXrx9ieEA+evgqEWOkp9Y3fnMkSyKvsi+ouc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDr3Otgy; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7b248750279so4330407b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 19:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777515932; cv=none;
        d=google.com; s=arc-20240605;
        b=EDqJHmweBWTo6MYj9vQEZ6nQez+cGDrvkUv2hsvGB8vT9gRCYNaT/ziHMcsFXaDKLF
         Zk3lxh7ZXKjt2by7obeK6/lUj1IW9Ad55GqjThwYEkR4SxewbGIIOMRsrw1BxJkLbZFe
         WaZAOH1BSegwS3bbbuQLnvpyK5+AE7VvDJCk7YftW2NcW76FYIeQi0GEazNTguISPXpg
         RTfU636i0mImD2zQPEwBDbgbdj7psLpIFiSKs0I4amtAM4N0mO06GSwEUp1124WNc2IC
         EYSXc3m0BGlcT5Z94hJ54aK5gnYdNzzvKv85dVo7vxi3yoY+G+T00yTrQrqhx6uTm5kn
         GcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZUNq0pEVTi4v1MCQaT+01GX4QNTIyjq5+3K/ZKdpTA=;
        fh=h9IgQW6Hvf8KcA9GvSOfaEhq06+rGw5RykjAxKXElos=;
        b=fDfBy7N94BLkrk+HZ3mODSIcp3DviBsaugkbyS7cNAP3st1gFty3G+up+2+2uiEfkt
         eY/cxJdy3eodBChOR5yC2uaCjmkKXWDx8v2icBYVJRfVa6iR1iUsny1/WOmbY23L9pzt
         MdzIPIg+RXEj2yfwh7OmF7YWdvIeAGYj+qv+n2k5ZXGl71r6ffa9acuKyvr2KfNMzER1
         0VhhhyNCPHr06AvcVTmEHJ6XIhbPHhCWfemht/rTWih6PaQzqnntZxp+a+UrYMru2gm4
         7wSCQxRR5vBC4WLI+NiaTM5P8n+xBQwYnrHRTW7aOmYfuGmYH1N7flAZRx6ie2zTvC3Z
         KVpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777515932; x=1778120732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZUNq0pEVTi4v1MCQaT+01GX4QNTIyjq5+3K/ZKdpTA=;
        b=GDr3Otgy1rrmuHHtoSI1k5vHPtTE6NbX/W6jHiEz9KZVbLTA0Fitq1ASucwT/5tkCd
         6/Ez866Rwx/lglQ8b/BN1Bhm1K/NAUC/zCVonJwKjnwWaFYniKnlLzDIJHMMKiAe4vqr
         zSx4xHpfT6mTljYjnXkutghiRE29yAwKyjzzED3M7Rgp2LcbBFRHyVYCK9W1rCkD8HyJ
         +O50pFcwNf4wcL54fhjF+qI3HijJNjqeICEjBnR6Vh3WxgR3+JRgAcIjclRbOlGCagXh
         cACaWu+dv18vjovG2UqpHy1yyRVdsYnCzyyHS565y1gFNzMOb068wTVEtLcy1gVVYkBi
         L5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777515932; x=1778120732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZUNq0pEVTi4v1MCQaT+01GX4QNTIyjq5+3K/ZKdpTA=;
        b=K+6KwvziWpXqlu01JQhoDsP+9WIJwLrEzmAfd+VWx5XN9jZTV6kmV4bFTcRAeE3zme
         cD5EsCUVH7sUz4ef9+fAI0TYWqE7eG+3XgDJPVklJ3uAztpTZUsZKq2dCiG40xn63SFu
         Y6nUDuenxDxaNHKLGgydBU63bsHWnCH2Ls/emu0/FkJkic6Q/5OytO6qCgtk1ymLhvDP
         q39xFFCJqSM0fkEa4n5BZOy+rxXDz/pVbXHYaGEPzkEfenwDKuQkNcmLnmYrBPn5LT6B
         Sbhhs5uaZeEVJJnp7xs9Op2LsMvJvu+wu28pYBJRwguZaVJWpDx6ADAAN/tlFuiZgl5v
         YDiA==
X-Forwarded-Encrypted: i=1; AFNElJ9TvyQEpd5CB/XCFmIR4nndHqUSaFK/5vc39NAeycUu9fnYh1KibPIDoXRxG/cF8+IAU0olo4K+Lsje@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4lfDxYNSWxpQl801I5GdferJA/drFLgOFH128/2kjza7jpYR
	MaSGYGqUS4Jep0gVE6BcIi1FZxF5sgB5+N4WJvrq5GKb4UMjZ5eSaDLaDy9yd5YBOejs0QWdbpM
	aZYM2hunMf9VicYk2GYJO+CjDajxiiRc=
X-Gm-Gg: AeBDievoOUxNR7bbuQUByqfOpLlIeR0Y+9TT6a9/AMWTGdWemglXL6FjejdYJZZ7YUR
	NPjs3LtNKAlTC9Q2g4eT58+maJ0k4+hGOXK4o6s6eNuE/SYDU/TBA8DK+qLJWgUBbND9Ettb2JZ
	9o/Evc4L2LxCV7nR1bzAkSLvB5SGpWx+upoks4rejhbT0xFfyK27bx6+DsH1cmKkSKUlRN6aeDu
	kYWEoOgc6N8vadTfCRU8U34/Oju9sCN28G5Hr7UEiLIvBe/cSCwqi7t2WTTHfmmjC7ELmK426Mb
	TGO9Aq4htza3nwA=
X-Received: by 2002:a05:690c:c190:b0:7ba:ef98:9720 with SMTP id
 00721157ae682-7bd52817ed2mr12695977b3.4.1777515931715; Wed, 29 Apr 2026
 19:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428113439.9783-1-m32285159@gmail.com> <177744903886.12633.3965286589243118427.b4-ty@oss.qualcomm.com>
In-Reply-To: <177744903886.12633.3965286589243118427.b4-ty@oss.qualcomm.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 29 Apr 2026 21:25:21 -0500
X-Gm-Features: AVHnY4KcID3GunPoTEZX6ZmZWRdAtqLguXvka3Ykfl-131gLZuN3RmMVJWedlnY
Message-ID: <CAKqfh0EMK52nq5XuypBfoEKE81xKuQRX5Uy9aY2XAFZfxzDWMw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sim: Replace sprintf() with sysfs_emit()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 82C9D49C5B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35819-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]

On Wed, Apr 29, 2026 at 2:50=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> On Tue, 28 Apr 2026 06:34:39 -0500, Maxwell Doose wrote:
> > Replace sprintf() function calls with sysfs_emit() in the configfs show
> > callbacks. This will help harden the driver and will bring the driver
> > up-to-date with more modern functions.
> >
> >
>
> Applied, thanks!
>

Nice, glad this got through. Looking forward to making more contributions!

best regards,
maxwell





> [1/1] gpio: sim: Replace sprintf() with sysfs_emit()
>       https://git.kernel.org/brgl/c/be22c0f7f2d573addcdf3a92f8aaef7a45a8c=
133
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

