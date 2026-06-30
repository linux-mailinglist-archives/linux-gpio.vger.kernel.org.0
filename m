Return-Path: <linux-gpio+bounces-39191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v2PwAW+sQ2ooewoAu9opvQ
	(envelope-from <linux-gpio+bounces-39191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:45:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB216E3C88
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 13:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=STEoDo6S;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39191-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39191-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68468301B035
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7714014B8;
	Tue, 30 Jun 2026 11:36:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FDE3F8EDA
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:36:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819403; cv=none; b=drhPa58ETcylho96UbxOzPlncCFPp7R/BoGdFx7HYwQAsHI/fNnAxuBfJjB9eVHNO9JlWWQgrWe+Vs7SeN14GS2mig0eCQhN8NFmmZx+LluVEUA38z2WCVRxDUp3dqSWwmgPQ7pws8mII7FcKIVeRBPXW7q7ulgIT/W3YvxU3h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819403; c=relaxed/simple;
	bh=k1siOPcWAKNP0ifXqQpv6Fdl+gbu3rJlsbm9cF84yPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3BC3tv0IA07pukoZmoQvnlnrt0VAMkWzf1z3pTsCyck0iyofYuc0Z1iHhT1IQg/NctTqKEehLgZ4g1nEjvavwN+Boc1ZRbOrB4PPim5q4RwJaLWBVda3MKLw1HwiKlpDShlzCVp33JPE5ggGZIE7RTVEdB4hpglD3fALpDlDLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STEoDo6S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188AD1F00ADB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819402;
	bh=k1siOPcWAKNP0ifXqQpv6Fdl+gbu3rJlsbm9cF84yPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=STEoDo6SG9fwUsVOXvJ39bWzZXydJureSnmU04tt+ZrDLU8H38whEcOsi/VkbHJ7r
	 OiRZxuq3TrX8MyWyXSEKr6K4Rb17aTZ7uSN00nDx9lf02SJdrTNr6ZNV3MucNLd3gs
	 7uOvg/mAe7LZ+dFEHgSMSs5GyJPVzNFQQNcZ3LzY+gFuBZ/EDoRE6Y3sObgDevcWwO
	 Ry/B3IYsO/yKEcSwh2BXFccQ8NqUbrm0EL8SOHTPo5U9hvPwNtKiUOl3pTNXabo03J
	 GPx4fm0JgedcLBnvrUOoXQRFU5di7VtihHJhFD5c7w9wsFnh5U0rejLOrXsxrFT/wU
	 gzkBlqs4I7hQQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39adb9a103aso33463671fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8O1nAZYiymML5nYMbEScuHBjMISxkrhVncvuEAwYhkxsMnJFB98/5PV++fJ3GIhGFvVCKCo2Bci3m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LCblP0TNeuFv2Lz47VGcS0d/Ed79UM17HUhO3ONWIk+aIqR7
	08PkpUH4+bg08dMMfQ22GVNBTJWq+kJgUbBlP9ere+Kd/jtwSkNoo10HTLWj8asRKG6QpyJAXs2
	u1GQ3v3cKUhjxLFrXDXcaj8GsTwQoSe8=
X-Received: by 2002:a05:6512:31d4:b0:5ae:b260:cf4b with SMTP id
 2adb3069b0e04-5aebdbc7cbamr833596e87.64.1782819400838; Tue, 30 Jun 2026
 04:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:36:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYzGi3KrVtTw+m_H=BVWChMaF6fFF++hg_nZLwAOMuCQ@mail.gmail.com>
X-Gm-Features: AVVi8CebyNlIglBQIcQKyVXZ7o8kY_lFSVk7vYSCrSZxltHIlhUqN_iKl5FCZ3o
Message-ID: <CAD++jLkYzGi3KrVtTw+m_H=BVWChMaF6fFF++hg_nZLwAOMuCQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39191-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DB216E3C88

On Mon, Jun 22, 2026 at 9:35=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
> will be upstreamed later.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v3:
> - add reviewed-by tag
> - remove comments before msm_pingroup
> - Link to v2: https://lore.kernel.org/r/20260614-maili-pinctrl-v2-0-0db5b=
fc23d64@oss.qualcomm.com

FWIW looks good to me
Acked-by: Linus Walleij <linusw@kernel.org>

Bartosz is queueing Qualcomm patches now, he will decide on this patch.

Yours,
Linus Walleij

