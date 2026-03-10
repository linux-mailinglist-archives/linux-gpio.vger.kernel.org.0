Return-Path: <linux-gpio+bounces-32915-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MwuIL4DsGkWegIAu9opvQ
	(envelope-from <linux-gpio+bounces-32915-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:42:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD724B63D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C14F630772B0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31475421880;
	Tue, 10 Mar 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW3Nm771"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545441C305
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142147; cv=none; b=cykZ1CI8MD5ubhTcb+vkxIzqVpj1UKD/aX6/py9J2I/4Krd723PHo7/IuRu4t95R7P08fAWTVAAJFDo2jN/N7/XHo/jyC3mL0DMcUS4CaQ1cz9Dcb02vMws5tcKexj26fo0mZO2OguaEBLhercNfAjavKHb2Bq/lloHpn2EXzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142147; c=relaxed/simple;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0UytXCVA2bzUY/Uk0cm8xAxWxIJTelrECsTxmcsR1IqY1A8LMvhYz0EYcojCl3CUmy0CSjCZAyjcSoBXzdJdy3WbmFCwWNgvQSlRYAnTPgqCOm9AANfb+v4eCYudjWB8Y8oGGlyjkSvk7nMOZl2tgc7EpicQg9dUuvg66WGq+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW3Nm771; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F0BC2BCB6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142146;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZW3Nm771/UCnueFf/eUBV1D3yHpkta92iH3jndTPOZAEAylW7z6etVRefddlIJz/C
	 VN7Z5QU5bv8dokHzUrrxNM4iwj7pXSZbooum6uV3auNhuW5F9DRuy0YVn4bNWbE5YO
	 QsX6IRG0lZpstJB7azuGAZTFoi7xYgJgIe4WLGCrVKoyTDWWG71AWbtymfL/ncjU+d
	 0j0WI9r97EeYPeCxIuHrmvN9INmGgiQqXO/8ZYR1cUCVSJX3XwxPwedRGrtIu4wudr
	 AeU3ByoGbp7tJGhv5hABrG8IX5WOH/IN6FkDGne34+QJped0igeqrpmmPNHJzqG4Ci
	 d2yHn7Va1E3Jw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79907171da2so14943837b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5d3AzIuZgYjiYFsMW8lvyybWq832BWGFajJg4Jfe7OzF7oIUNt+g53qEsOromgIRGZaBBJ3xrT17v@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrAoNLfCjCWItzWlMAfy6/vPv+Cneo/xiwT8e360zmhUNHxoj
	A5UW+0Elbc/PiaroGYvNC1IGYFNVQR1CMgRxzmcsURgQh17mbjdISD+ROQpYF/kDtNeYNsz6Bbv
	7vzsJjsIfZxznh7rEb2gMGtHkcFc1VXs=
X-Received: by 2002:a05:690c:c4f9:b0:796:4b03:73bd with SMTP id
 00721157ae682-798dd771382mr133874007b3.31.1773142146174; Tue, 10 Mar 2026
 04:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:28:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
X-Gm-Features: AaiRm53kS4zQliTIX4Fn5ceGqrudwVM7-RS-_bNOw_f_i9rtyZ-GaueU-4PyAHw
Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 94AD724B63D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32915-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fairphone.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a driver for the pin controller in the Low Power Audio SubSystem
> (LPASS) on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied to the pinctrl tree.

The patch is minimal and simple, any remaining issues
can be fixed in-tree.

(If Bj=C3=B6rn yells I will back it out...)

Yours,
Linus Walleij

