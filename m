Return-Path: <linux-gpio+bounces-32347-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNKvGShKo2nW/AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32347-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 21:03:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE741C7DA7
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 21:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3531032FB23B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 19:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A02377033;
	Sat, 28 Feb 2026 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCgsxGg+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C372237702F
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772301639; cv=pass; b=mUbARcKyA/TVHKi51qblIhnEARdbMMkDU4woriSkCusK8PTjfdmJQwxGNVHMGJWEbFqBDhzjQtrwHgU8PQdG562GE59dlyQi5i4iJNvJwTEBTHxXpFOZng21RjrlKZ6EUivqPiGOM46m50cS+MnqyEzKuX2hWRuCsmSdWpwBxE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772301639; c=relaxed/simple;
	bh=hlSsWByQbTxjiPEqkfTj4A5N00y7errpXNbjwQ/eL74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGA2QvNCzn3keA/z9nFVXXoaeyYd8TyOjl9V3GkGH+ase3kES4ZcT5wQ2qPBsr3avw+0Ntrhs8fqOch26E+w6P2Puy3owz7OIJ97vclV9rE4DNMl1Qp3wBuRay8OYsVRezkUdCd5nfjMmaU8tv5KhkjzQvFGztas9RZUJmYV+4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCgsxGg+; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506a019a7f3so39945751cf.3
        for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 10:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772301638; cv=none;
        d=google.com; s=arc-20240605;
        b=LPtAeo4FAyo5uTYoT9DLyXv6SFwLV3X5NdeLDi3aIWVZVRi6S6H+kCw4rjB6w9YE31
         h7gl8+tfGzTb5eYWUWRsnn0PKFCKud8Xuz57We9fdwbP7pDp1y+PsLnioPeyjzf5Yavk
         dGfCT2H1GyeAHpS5oe1HUs8xMuz6bMo3apelvcggvhJ0j8w/inAfwP2TPSQjjcGT8kA5
         t+I+ZaFVSS1Y1i2LZJzFnlLpI2wLPwmh3Qyjij4QXJdxAc26JP5tLr5Wph6Jp3QEaQdS
         +oJbv1kiQp3jI1tjBTts13dkxRr1QgjLyCwKFpv+kT1MJXf2bNt3R5uKfmCZsz6I4IiU
         /Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        fh=xJVUQi3DxnjJhCzi24/ESMO7673O9tRMc/ELO8Md/eU=;
        b=LApEk30xkXUDDM7jAmjaV95kncnqD0MSD7lF59z1xP81CbOSPtSckKbuEpYf0z9qZk
         BeRCouWAow7B7r5q3gnTwnkLqhKmK/h8jeDqkQl6GzGXlhwhwKPZsWaVk89fdldSMvYL
         cvhNOveofdFZ5HrirRmweunr48VzGZqklqcev9eHPn7OpkIqpyYRv+6HfVrZrLkWyvCA
         LacMUMG8QDAcIG/P/Mh0mUqMpNX+z0gGU9xChKbJZFV3wIegUqgjUuPX0Y690N2F90KZ
         kAe9pr1VEJI8VX6HaWO33uh4HIqpRmkks6lpDgT6+tFyLUMChZe0OLlb166lTeT0Slyw
         MylA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772301638; x=1772906438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=iCgsxGg+tT1SyuKv8XUbyGWtJcgrqE2sG6t4W2kiANh7CrxiFbAoiJc/FnUi07xZiK
         cu6b2hXnWhYUF+cCX4dQgrvstEVMkj/Jf9DpICsP21QdVSz/liS8L1V8zdCiAqKrCjqb
         TsZgH2SRsfMxh9MIeWWp6JJ/A88VzAlwM6AQ70idPNra/mrOiM/ywRHl7/4/0PFjgCA5
         F9rZ8Flb69li3k7Kemax7OE10LMq/jZdomb7m7I5mkfXQJdQnKCoGIAzePtF4DZu+A9i
         IBt79xWyIHuBvmdX50wfuDwGNTJlQE1NOA8iD0oZiKyauCGKnnykgzCY6xZ8ti61nEVT
         X2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772301638; x=1772906438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzbAnz6T/IhzT60BwbsGo7FPW25EednVTt62Gcqnlt4=;
        b=hgnDEUGlgrmJZKL+DuK1cZL3fiP4D8Efg4kCjiHoXtlDNscnC6owRQaLHKWrjItHKs
         xCM9+yOemLJzccSqzni3BCitWKHtGy0dBhmSUxInPLnWF3HJSs66nn1zqNJh5A6zrKIG
         HFwYYpZCLGDWaxAQTgiAwsLy26pwTIEEVJXT76ighPHYEpFbWU0+wJcgHU6izw4gIHYy
         M2dl/MFmkdRj2ATTNCm0tUNHRAK4uTdGK7pkU/wvZqmZqTjdFO0RuPwGHhIqltYZkJV2
         Na1JaB3s7ivk/Sma/xLIqcIotrYWuf+EYjRWG8PgaUbvkFDuVsCuP0fchh0FY1Ll8axw
         NuYg==
X-Forwarded-Encrypted: i=1; AJvYcCWRiyhItVmd9oaRsFhtms2WftsTS6ImI1UEamSkCKEgrMl3v7oBE7ob3HlvYSvXQ7n8yPPu1m7KhAmc@vger.kernel.org
X-Gm-Message-State: AOJu0YxJRWLwqhGJiHVVCWLzh84Gz10tBxCGj5RqORNjgFHGt/qzs8y4
	bHjQepQ16TpZDz5dmrHCOEyQLFskOxLVUqa6T51LG2Ct2o+fMC4HGer33bNIOPbYjLGuZxepOh0
	/qbJyscPaO3MBh8ijfjM1enb//2+Izr8=
X-Gm-Gg: ATEYQzzg7gQY9WMggYU1Z5ngTlzRfZPH77zch5YMM4khSfp2gqEenGTboG6zjTkkeMz
	cqexbIcEa9uc+eaw4X+aUd3qARWir6hqZolQarVgmJjHVTOR8HQI3XEQViGgfgKAdMotZJrhUmF
	SXt1jkUDmQ0G+1fNgzRyc84xfAXFRzMSEznU5NZk0qqraucDnSdK8/SP9fm/kfE9GmB8MoO2Dyw
	IHKbxY8YgGuxBYa4aAKdjBtMPQjCuAZYMDSpFQ4QKNCzRpmlf8ILWSaPoHxJE9RU/+A8gezV3ZM
	Qk42TSV0YVTy1QM3Bs4ImUVt
X-Received: by 2002:ac8:5f4c:0:b0:4ff:b211:6aa6 with SMTP id
 d75a77b69052e-50752796176mr90990561cf.27.1772301637636; Sat, 28 Feb 2026
 10:00:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260111092833.466263-1-akkun11.open@gmail.com> <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
In-Reply-To: <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sun, 1 Mar 2026 03:00:26 +0900
X-Gm-Features: AaiRm512V9E6SYs2_Yyac0rJXDDdrcUO_TD7gqKE_u9D1yEofE0XT1GKOLrzGEk
Message-ID: <CAKr_iV40A8=8e4Bqez-mbq6Jt+ZVNH=Vbvk1mQPZq1Z_feu+ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: introduce per-function
 multibase control
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	"moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32347-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akkun11open@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: BDE741C7DA7
X-Rspamd-Action: no action

On Mon, Jan 12, 2026 at 5:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Thanks for the patch!
> What you're saying here makes a lot of sense, but there's one big questio=
n for you.
>
> Have you considered migrating those pinctrl drivers to use a PIN_FIELD_BA=
SE()
> like it's being done for all other(/newer) MediaTek SoCs?
>
> Why would this not be applicable for those old ones?

Hi Angelo,

Thanks for your review and sorry for the too late response.

I am developing the pinctrl driver for MT6589 and initially based
it on the MT8135 driver, because those two SoCs are very similar.
However, I realized that the hard-coded multi-base settings in v1
are not compatible with MT6589, which led me to create this patch.

After looking at v2, it seems likely compatible with MT6589 as well,
so I will proceed with my development based on v2.

Also, this patch has two flaws:

- It hard-codes the behavior of mt8365_set_clr_mode, which would
  cause issues if there are other SoCs similar to MT8365.
- spec_ies_smt_set expects the IES and SMT registers to be on the same
  base; if an SoC does not follow this, additional handling will be require=
d.

Please ignore this patch for now.

Best regards,
Akari

