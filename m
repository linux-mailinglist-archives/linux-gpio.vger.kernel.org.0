Return-Path: <linux-gpio+bounces-39040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bL7zLqqQPmplIAkAu9opvQ
	(envelope-from <linux-gpio+bounces-39040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 16:46:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 376946CE128
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 16:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YtFPFR86;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39040-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39040-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88393308D403
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 14:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C7A3F99F4;
	Fri, 26 Jun 2026 14:44:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323563F99E6
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:44:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485080; cv=none; b=BNoLk/Qu9VNc6Qfeu02b83UV3rn17v6spfMXv0fBz3o4XwseZ4OhfoFS132994P4jwuSx27f7i8Y95gCJOMxtx3uqCfPDaFNXk3e0v0IXqoCeevderrfeAVo4HSSi36vUIW+zUe2fM1A+evcBC3HRlhsZ36stJLxM/cjmoqH+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485080; c=relaxed/simple;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlLjknkJz0MU9YI/4wr4tUBjK13MQNflNzFWD9fo+uXOWGWFrTUbgz2QW4zxGeT+ASTIcK9ylTAIxzFtCGCXjw6LNoec6Lf5f9hYfCdMgLhRHklMbr3guDn5GZoMmbbvnD+y0EUspH2eew9YVJpy/l7BVVA5YGHzcXpzHoa5RUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtFPFR86; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3A01F00AC4
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782485079;
	bh=wo7pqiPSksjfBjenX/Wxro0deCHdEvK5J0TuZLF/5UY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YtFPFR86jlEfPinvTKPO7Xo3Q6Pn6lfCRb4oZkeiDpFCN/D9mtc4Lfcxbv/D7oPaR
	 58UssOuuRrEHnPGYkn4D76RRI7KpSuZ0S8y2i5Z1zBdD8Sy/dRepuxmjdF8Y6i1WEg
	 zZK14SsSHAiPl+cha1o773qyZnPFafIWYkSojb+kQk2mPYHf+iBdqhRRdSz88VYHw2
	 twuY6MDayMn7HLSVUkFRYhzwi7xG99ZqOx8pw99SVBRNtXEqNmEEOAT+nHpYwMulRZ
	 57+/tXEJfpv338WK2zKdWRyYKAsC+fpdrKZVAf3mOtbTIwkQXBIklFkmOlKO4gDkBP
	 TkDkyagASTcCw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so875237e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 07:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoSyYv6QlCbFWOIg94KzgGRnzYAf65LNfHMTYKQToqoC+m6uSRKcjvok4JqNISIyDrx1SFiVUxXTeJD@vger.kernel.org
X-Gm-Message-State: AOJu0YzDG48a28YNyT/C1UKgURwcJ1aF/OKT6EyUyaOOJovUMBtazF7T
	rvZ8+1XgdXb9qkewHWRBiyimi3IEGRvQ5wWT6ijl+LhHpAieUNnTKEbEKFII3T4tywACRSETzcl
	gRUOXjWHSBjM8qltvACvcTZclcqZE2p/r6l5+IBZbSA==
X-Received: by 2002:a05:6512:1325:b0:5a8:8db6:b3d with SMTP id
 2adb3069b0e04-5aea1f4b9aamr2215524e87.24.1782485077659; Fri, 26 Jun 2026
 07:44:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 07:44:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
 <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com> <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Date: Fri, 26 Jun 2026 07:44:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
X-Gm-Features: AVVi8CdivKvRCew0jR-PMn3z_xAGV9V8TCmmlzMbwwdMXjc2U3bvSB-7dauR6_Q
Message-ID: <CAMRc=Me+ZBSMaOYGRUKonA=dbNkHY3Ovag0J4E8rr8oESSkGdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39040-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:fenglin.wu@oss.qualcomm.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 376946CE128

On Fri, 26 Jun 2026 15:00:36 +0200, Linus Walleij <linusw@kernel.org> said:
> On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualco=
mm.com> wrote:
>
>
>> Add PMG1110 GPIO support with its compatible string and match data.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>
> Acked-by: Linus Walleij <linusw@kernel.org>
>
> Bartosz will queue the patch, I think.
>
> Yours,
> Linus Walleij
>

I will go through the pending patches next week. Thanks.

Bart

