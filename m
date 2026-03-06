Return-Path: <linux-gpio+bounces-32705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLchIjdmq2kfcwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:41:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB33228CD3
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88168301BA4F
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 23:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23943822BD;
	Fri,  6 Mar 2026 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt9v2Bjb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C303793BD
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772840492; cv=none; b=VFifgRi5iA2c4O+ADSwDtr3qP4RFyLk+0jrVPczbQpUUuSc6vbXgsXdtQaDMMvdLM7f026p1s2YIgYDaRyo0v+KgqLMdnTTsyucB2hfw64ulbJFstWgOg/lHAOhMtjz1o/wJr9IQptewzIFyc3pS2D1TTiebv3zPkko/8X2OU98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772840492; c=relaxed/simple;
	bh=lGMWfS74NJY/45L/a/o5t4Cbv/9+UpWGzQFpuXOjHbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZFMnIX/qdfPQ/GTx/91i7ttZ7nfm4lzARmafGiQYKm6yCTk3+43Uk7f7+9CbxLRHoib4TX7szGeo5W1CcS0XVRBrKTGRKBmOPcSBLQB/FpSWk0Goa0YcpgoDWp+5aWPIQsHbw/h8aEg6Qy/x0SdfwzZOuplaNZdc23DPQSs/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt9v2Bjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38110C2BC9E
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 23:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772840492;
	bh=lGMWfS74NJY/45L/a/o5t4Cbv/9+UpWGzQFpuXOjHbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zt9v2BjbSSGQezNO1Hu44qRx045EdpBGtYWOb/wTbxHr+RK0tHDuXLaiKIG/yqNyf
	 N2qoYPBi7CpxyWDRGlPsqcbK4gP2omN2Lsp64OparxMvMt1g26ispu5NfF6B4ydiAw
	 5vPcdE7QyyX9MSx6iqSMpL+f1yJyzrmxLu4zG4IBYW+RXx2N4hWGC5r2aHUT6gSDxO
	 LfFB1wF1IRKBNW53T2TrMMvQrQZTVW4KcDbJZwZ+KasNUl8lNdg0DgmCM/abXWx1J8
	 AjkKIZnt32WLrFRVGBkjf351QS9RZxE8pwWOAsR/ffCP13FpqjnNWJnyxR29Ne+1Rc
	 vxRcnqG+uWAWw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1678191966b.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 15:41:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2YCGsT7Pvfqr1cPD6KQ5xjoJv4O6fxQLWt1ZEQLS1DCnwfW51idDvAgHrb5+ijxgSlWPqgaeIYUks@vger.kernel.org
X-Gm-Message-State: AOJu0YxIVd1YVuSqpczHIwwHzJh5E3Uv64X+B3knkA4DGFN85I+JtCbJ
	edo+phUNvhiF9SmSy1eGDy8dtXyrnRHkp4zCKJKxR4yZ7YiG6oXXTXRa+5Jhw/QHxt8v7ftNQpn
	x+ltvVevc4T8cyvK1896aHfug/6FXSw==
X-Received: by 2002:a17:907:3d8b:b0:b43:b7ec:b8a1 with SMTP id
 a640c23a62f3a-b942dcee05cmr214770266b.24.1772840490659; Fri, 06 Mar 2026
 15:41:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-stimulate-fraying-29ac76f6c55e@wendy> <20260224-salami-divisibly-57447839a0f9@wendy>
In-Reply-To: <20260224-salami-divisibly-57447839a0f9@wendy>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Mar 2026 17:41:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjguKzcqNRtt3=8oHpxn7qEMaTkAC2pFj=2VsVyBW4cw@mail.gmail.com>
X-Gm-Features: AaiRm52_VXNxjPQB_4wKaRRCRa-YiWwW8hzN0ncM5NfUbRzPofPv8R8LfE4HQ8w
Message-ID: <CAL_JsqJjguKzcqNRtt3=8oHpxn7qEMaTkAC2pFj=2VsVyBW4cw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/2] dt-bindings: pinctrl: pincfg-node: add
 restrictions on conflicting properties
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linusw@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DFB33228CD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32705-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:41=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> Many of the possible pincfg properties are not compatible with one
> another, either because they represent mutually exclusive states for a
> pin or because they provide the same information in different units.
>
> Add some simple restrictions to prevent invalid configurations.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pinctrl/pincfg-node.yaml         | 105 ++++++++++++++++--
>  1 file changed, 98 insertions(+), 7 deletions(-)

This causes new warnings on Xilinx zynqmp and I think some QCom platforms.

Rob

