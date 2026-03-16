Return-Path: <linux-gpio+bounces-33475-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGYNEjHMt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33475-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:24:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7479296E5C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9050630480A2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB538386C24;
	Mon, 16 Mar 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9evFy/E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCC386C0C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652884; cv=none; b=tMaIIGlI8Rk71AGju1i3l0ZPHPyHGd9fKj8OcJtK6peNuWNfghsTaOs4Huy/mxh1OYRkaosYelTxBHK2ep5yPoH8JXJ20W79nRxZwNvkvBjEHGzvE8cDr+NU6CnqadXYvsKBv35/yQULdDesV2Tuy1xjyEvX0Sczr3ISYl68Cec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652884; c=relaxed/simple;
	bh=vVjSubnJVZYYO8zwKS72sJnNwagmstTRBXVn9F9eGMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZWh643RgVz6LxiDT6mkcmHmWB34ayT+CFNAG9PxT4aXIdtWwwej4IcNLOE7twbWDEXyrV7GuAn3+H07vKyslphqGbZNq/+Wpn/MG5BGXY4+gqrdt0LDRHVDOwTQxNbEio+3WggyoxalNPptYfwf5QFYdYRHP7CKuTMYJb/V2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9evFy/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE28C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773652884;
	bh=vVjSubnJVZYYO8zwKS72sJnNwagmstTRBXVn9F9eGMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q9evFy/EKG+Gy5zNYg14BRPUVdgBnZc2IqwtiSEMGpYcfnDOjfEJZenbKEYov9x6d
	 S4m336xEGkXUtSzBLdCa6afirj0TXjhErXHt2fmIHEHljBy4ufyMIfmLlhCMYrbwMU
	 Kv9qbT6qVWbd8aOK+5yt5gT9zoSdiarTQUfm69fhtp0cX5TUnLpprxFt4Z0iv5yg1A
	 AZ71B36oFU3DW/j9rVAe3j/eHcPEs9jgt0jhPHmUjhvpYT18I0JtbPLu3yzAN8H5Nn
	 w/lSze/W5al7um9hzfYte8B9vmxlyKN3lAH/B9Fr/QbExyTp9rGMfWxpEiToZFdcya
	 cOssCUK93p6FA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso38286611fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:21:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBwVEkB2bjd+7/h9mRrsc9qPEPcupIp35+rnXoFHuRPnQlCCdFUdJ4IcBoeEo8u015gRsK5gRINQc9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQT77RjNGYlzkW9GnatplcwbnigRSinlb3d5TggM3njUTABoty
	7cFrrgqWTvHfuops9wXSQjfnYrxn2MYIIR94jdzhw1B9nVCrYlHdIdDfAWNkNJTXaS1IJWC4e6v
	/HmsGPhEC+XpR65nrjbUIGFtIUsk/+O8W7DkCmCcW3w==
X-Received: by 2002:a05:651c:993:b0:38a:38cc:c03e with SMTP id
 38308e7fff4ca-38a897de723mr35980491fa.31.1773652882818; Mon, 16 Mar 2026
 02:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org> <20260313-gpio-mmio-more-v2-3-0f777b63105a@kernel.org>
In-Reply-To: <20260313-gpio-mmio-more-v2-3-0f777b63105a@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 10:21:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdxgW9kMnHJeR5KARTSpdbT_=MeEVDCMMjsoqcqv4U+eg@mail.gmail.com>
X-Gm-Features: AaiRm50TpkOT65mzmcEL0rr37SO4Gyjxc4-6OJtuq4US5ceeOPyNgNNk7GV69ew
Message-ID: <CAMRc=MdxgW9kMnHJeR5KARTSpdbT_=MeEVDCMMjsoqcqv4U+eg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: altera: Use generic MMIO GPIO
To: Linus Walleij <linusw@kernel.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-33475-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B7479296E5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 11:49=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> If we use the generic GPIO lib for MMIO in the Altera driver
> we do not only cut down on the code, we also get get/set_multiple
> for free.
>
> Keep the local raw spinlock instead of reusing the bgpio spinlock
> because it makes the gpiochip and irqchip nicely orthogonal.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

This looks good, any chance we could get a Tested-by?

Bart

