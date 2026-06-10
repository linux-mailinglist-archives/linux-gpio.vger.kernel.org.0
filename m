Return-Path: <linux-gpio+bounces-38289-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMxNEaTLKWridQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38289-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:40:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 886C766CDB3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 22:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a014vL1R;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38289-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38289-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61BE130EA060
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 20:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EDE47ECFD;
	Wed, 10 Jun 2026 20:40:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281447ECCE
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:39:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124000; cv=none; b=TFSUpDLNDXHXytSP8uOpkezHmXmFe1OBARfwaMmFA0MSNGkdl2fW+2cgIAYqwQg7ZBOnsZMbZRxs5tZO0FsgfJJp5mXbidXlbpjYebHjNDlhB9uE/Te10ZHYCnYpdfDyDnE2kdUSxE+uy7Y4Aipyh4vmoEFRqlRhV5keYoNgDuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124000; c=relaxed/simple;
	bh=SJ02lCmDTteayUQgEckfVx9Or65JRckmT4yD2bXXZLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbXxCit8ILPh1H0q3Z0d1ZHcrXjav1eVvrotfk+ER2CJEd0an/DM8RSRalhLJClAvkCykwtN+S4P2kn1lQUzHfObcFXB8j+mNka1QagQwtsBs9ohQwuxZSPz7/y0+7v1EwoUO0CIrKJ0yV2F3dPhH/XXS4+TirkcdrQ9kTqD7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a014vL1R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7711F00898
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123999;
	bh=SJ02lCmDTteayUQgEckfVx9Or65JRckmT4yD2bXXZLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a014vL1R/R0xgG1n7YH7xIwr3zR3J1U+pxRura2KA+RuKR9DTFBVyVT/4WGCOBznw
	 gI4xTp7e/D7oyfdYTXq+1zM0bAKTTfXaqBR+omYHSxc31+iPs+u8BWvD6CDIwLXxu8
	 U+fZ9kBEFtZ8HGyZlA4mULXypEO7kBB03vaTWsy6DC9k605fZH9KrlXVsORqO/r6hQ
	 yN5jacxQJPcHWDOuDkZrkHWctj7gkOiFngyA4ZfOiijb2xW2VW5RRFoTk6F2ZQssbS
	 0ZW4AkM7P907bi/7VItvBDxgj9r6qCLCCz9zUjoyNDhup3MreLKC2ancltM1746BHA
	 gKSnG/NGkAwww==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-396669329fbso2575241fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 13:39:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Mpo/NKDA+tye+WqyKyv4zUESgoTjAdh09BMdCpiZUCrEI2fUoZ8lKufnJYQ0CHa6BKOZc9YuX86bA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sWQVGgNT0AELnkzCkGqn/T1l/UK95/4XA1LguXvI+egzpKuy
	IxL29Uxa70jLY3K0rXAt6sH/HGdVEGdm/C3fPBlCZOHzHdoLsxWCHBPdgephv6+JMAFXOy9giNw
	OomNawZExgIoL2l1ug0H1zLJVBENjok8=
X-Received: by 2002:a05:6512:68f:b0:5aa:5dc5:3e00 with SMTP id
 2adb3069b0e04-5ad2758bfb7mr55280e87.6.1781123998325; Wed, 10 Jun 2026
 13:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com> <93a55513-b09c-47a6-bd3b-cfed25ca7a70@oss.qualcomm.com>
In-Reply-To: <93a55513-b09c-47a6-bd3b-cfed25ca7a70@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 22:39:46 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ot0Cr2m5C-9O4L1e+vFyzHdbu59qzjipyy+xr239qyQ@mail.gmail.com>
X-Gm-Features: AVVi8Cc2IwZMbxPDJKqlMcuL19iWjJ0-kERNCT_cythH53CURH0SwnA3o-fw8Qk
Message-ID: <CAD++jL=ot0Cr2m5C-9O4L1e+vFyzHdbu59qzjipyy+xr239qyQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38289-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 886C766CDB3

On Wed, Jun 10, 2026 at 8:08=E2=80=AFPM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:

> Thanks for the report and for carrying this in linux-next.

Nah that was me, Bjorn is innocent this time.

> Root cause was an unused static wrapper (lpi_gpio_write()) left after
> the PM clock conversion.
>
> I=E2=80=99ve posted v2 here:
> https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qual=
comm.com/
>
> v2 removes the dead wrapper, keeps behavior unchanged, and also
> addresses follow-up naming/style feedback.

Thanks, I applied it!

Yours,
Linus Walleij

