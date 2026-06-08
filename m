Return-Path: <linux-gpio+bounces-38081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QAubKo6CJmr1XgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:51:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 406DC654383
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 10:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jghyXAOQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38081-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38081-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5786130090B4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989423AEF49;
	Mon,  8 Jun 2026 08:47:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BA1286D7D
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:47:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908443; cv=none; b=MG2/HKCNgZzTFjunfFm/ndQnLBXtzSBA19XDXiyEwNFi8E5DRuHRg5t2pP97DyBQrOhMUNfiw6rlcPxGs3xa+Rnh99VkqaD9ycJVC6HvECZSxgJMsdbpB3PtnMI2VhZi6LBN4d9RwtZmzKuUb15fHI83vuwv4QJau+uFbORiwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908443; c=relaxed/simple;
	bh=Yf3CyYl4VMgRspiYR3I8LvY03zCcSGBO2lzvyW4zCF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2G1BicIvDZzVL6PAlBv9EUpyxcPHRCjzvnGRKstdt8P2gvq/ncTayQH4efKDFVEi0N9I5owLzs9YFDD1WVADTxcM6zFyuZQvvMmzqC0vhP8XbDf22v4tGX9WZjxqBYL0LWK7kBGU1czbLpmQLC/rt6nWpy2XqCBIUs6Au6m0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jghyXAOQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701C81F0089A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780908442;
	bh=Yf3CyYl4VMgRspiYR3I8LvY03zCcSGBO2lzvyW4zCF4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jghyXAOQmVN4BbfROqOa9VTZntKKiwoLKsY6d0caWimBC4O4nHnVMJ+ChVrKRU2i9
	 /udZpeN4Ii7Gi/igcV2s1NHv+9qbMNzJ8WsaSEJKbiBtY20s2onAKdk0Uo90XuuNDq
	 hnfl2tjoSC0QWucCwwjV6lZjOHkv0evm7uWwvajfP5mSmf+7qzuZEtKGWy/0xuUQyb
	 lWM3chp5Uy89h1Eoj3L30y2ZxtvWBwGxQA8a/rarZmUUp6I9eFufOkxyKlRz6h7poh
	 MoOEJmYR/CAtyBYdOlqe4rwXJSzPjsC4qsPGbMeOQqEIxNQF6WC3S5ByGg8xVpeDL1
	 FhYKQUWY7BOaw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39697a4e16cso37719991fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 01:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bDQZFhN3sdQs+2nzct1+Jbp2NqvkDR0LTBW0PcQIiuiMgGfwKt3UPAVdH52VYI+b+Yhs5lGAowNdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxywt8dh3hmgu0UlSU38bB6rI617MklN+JbnAEGU+MKGyk5RQRR
	IAbYJVzKNkhrss8VUjAVIuKY1fgDOkq9uaLaUtU4V3+QikkAeolLZ3AGr/V/5JK2UZTIyvgLK7D
	ks7B5Bue+FxMLL8mV0dbY3l00150czWQ=
X-Received: by 2002:a2e:ab0f:0:b0:396:9966:50e0 with SMTP id
 38308e7fff4ca-396d09527c5mr39733731fa.21.1780908441227; Mon, 08 Jun 2026
 01:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:47:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLnWc6rZyPxeK=Eh0GCKRat40RinGV85jfAWGjKGgZd_oA@mail.gmail.com>
X-Gm-Features: AVVi8CdNEEoEMH0iuMwC7GYd2ePsxICzhmmlbj5h9pzEklzG3vk5nSereUX_1Ao
Message-ID: <CAD++jLnWc6rZyPxeK=Eh0GCKRat40RinGV85jfAWGjKGgZd_oA@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 0/2] pinctrl: qcom: lpass-lpi: Switch to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38081-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406DC654383

On Fri, May 22, 2026 at 10:47=E2=80=AFPM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:

> This series converts LPASS LPI pinctrl runtime clock handling to the PM
> clock framework and ensures GPIO register accesses runtime-resume the
> block before MMIO.

No reaction from maintainers so patches applied!

Yours,
Linus Walleij

