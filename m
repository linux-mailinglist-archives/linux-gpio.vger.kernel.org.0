Return-Path: <linux-gpio+bounces-30848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBeJA1jFcGkNZwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:23:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1656B24
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 13:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 255FC9A5169
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 12:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707DF301012;
	Wed, 21 Jan 2026 12:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCPNcQ9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F143634E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997575; cv=none; b=bsPE5LKopr8SyWdv5jzsRZr2Hwimh/90Lw/SZTNZQ4sbc+EkEBqmrUTfUW9CSSOkcoh68WBUws8nO8mwUaOIBTBv8+MDkuXGMXFqCfeNLc3j1PL+TriiiyttiX4pS0DDp0PyeJ9mIpk56KCuxfdIDXSAIQcZyCgzem7ewWuF0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997575; c=relaxed/simple;
	bh=PI5bzyg2ZRdJAMj7UrwsdRqkLrIVfZz1jN0efa5Iznc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8S/EurByj/wfpLcw5O3BX67RP3Ww+8GD5rKoKkZwQExjc0RfmMWaoxivODJlaaNkTD/M3M08qA5NBwDuTv/pgGi1Hfg6+Yq1wwPn2GDiugcQ4q7kF+B4N0+BGP7RXlZasel+1mDFxZe2VdHRdYX/Nc8lCBc/Iv2r429ZlWNtrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCPNcQ9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54EB9C2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997575;
	bh=PI5bzyg2ZRdJAMj7UrwsdRqkLrIVfZz1jN0efa5Iznc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fCPNcQ9f33PUhbEq3mB4KvbFz3Xaxfvg/gU6M4RzBEQxYL1FLfhuY09PXv+TtjUfY
	 jgwvixu6IErcgQOpeRBFfYZN21meBHPMTZ0s4KmdNs85oFmFJZ2NuJ1b5vo+h4C9Mz
	 N8J6DOfrDBxg03R+kHTsq2jfpnnb6PfZZkVc2bZbrKN9vJRsSCLr1aak4lo11V2zmU
	 b4fDLtg9uJOWLWmpPn+qRs2Z64VF+fxwOUrKGmhc04rmo/RhzE7z/tF2cTg1uzQ780
	 ehjHhslBnrIIR/QJytYa2SM0Y8Vp5mdPJDE7QYlG9wdRXYGKPQL27DebsfbCSlwmuA
	 WQlIFMsKcOewA==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6446c924f9eso5399455d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 04:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV28VI7R/PYWsIcxrYmuRPVOK6f+oUgKQkLFQh0Cw49kmDdN96TV0fzjIE5yYGaqCAW163LRTXsUqK@vger.kernel.org
X-Gm-Message-State: AOJu0YyAW5v3G0eUyldK69Qe71WRMRjAdhyE1p09XJ05X5YlBFn7jUb3
	Evo1yKlfCPgD7o/TzC0oK51XVfqA9yGNUNeVONdoPYGXP1p14eo0GlWOYXhRnRMp36hIHaHouZn
	jALZADzGoeKi2MeW4TUb72LDMTTwgGBc=
X-Received: by 2002:a53:a64b:0:b0:649:3b9:9269 with SMTP id
 956f58d0204a3-649164da795mr11509489d50.74.1768997574452; Wed, 21 Jan 2026
 04:12:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:12:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=PxhVWUwAimUF19=jKUZMXJM=SisK35dLcUiSXS0tugw@mail.gmail.com>
X-Gm-Features: AZwV_QhhDQtzC5CdMM7SDnJeSVDM5x-Es8fYH67jzhWM1JOF-XfEUlMRbO-js-0
Message-ID: <CAD++jL=PxhVWUwAimUF19=jKUZMXJM=SisK35dLcUiSXS0tugw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add Mahua TLMM support
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-30848-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 7EE1656B24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 6:23=E2=80=AFPM Gopikrishna Garmidi
<gopikrishna.garmidi@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
> variant of Qualcomm's Glymur compute SoC.
>
> Mahua shares the same pin configuration and GPIO layout as Glymur
> but requires different PDC (Power Domain Controller) wake IRQ
> mappings for proper wake-up functionality.
>
> Changes:
> - Add DeviceTree bindings for Mahua SoC TLMM block
> - Add Mahua-specific GPIO to PDC IRQ mappings
> - Add mahua tlmm soc data
> - Enable probe time config selection based on the compatible string
>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

This v3 is properly reviewed, so patches applied!

Thanks Gopikrishna!

Yours,
Linus Walleij

