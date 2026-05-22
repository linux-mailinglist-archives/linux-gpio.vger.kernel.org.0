Return-Path: <linux-gpio+bounces-37357-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPJWKRxAEGqCVQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37357-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:38:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFB5B319E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61DF7301A251
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA76B3DD877;
	Fri, 22 May 2026 11:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="aBjSySEf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E63DD50E;
	Fri, 22 May 2026 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449242; cv=none; b=K20MF90dA8mP/Kb1ln+M4iKuJIhPxcQWksgcKC0lB3SV5uQTK9IdtD0ffFAo1Gcr1KjlZ4U6iXcy/KOQnIgpKWsEbh898Vq1fxyxdyGxGISZn0SQ1I/ryY/gQ8qIfZZjaYVX6GrvtsdR+LuRjwPpbRy+XDfd7LppYbkSsvhNWYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449242; c=relaxed/simple;
	bh=b1usLtt6FTm0To+XoEgTuwRhDjFcDzhX+mRL55KQAMA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=WFFiWQW26xtozNb9RuCHsznS2sz0nO2hazUJ1CuY4N35vp1bO6VRfzM0vR/qyR+38t4PQk9prJfRSZ6D9+tjibTlgCGJQTqT1uXWSrEJb+N/2bArBpWaX+11DJF55IQWtLN8Pi9udDvbs8Psfs+7CnE/coz3xUuZTo3cx7Q+ABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=aBjSySEf; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779449176;
	bh=OvxAnjWqfX8/3mvrcZM41btS8w192cJEjZBEPQD+Gq8=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=aBjSySEfSdA1oWaXSWJwh9rn41CboTkcRTOZxzkmmD8pCS/6jTLuwNDgIUki07ifm
	 7I5rZGGOBCOZkPTkViJBkyjXooOQg+uMC4YMUFBL9ezc4vr7z1mTOzjbjiXlM6+0fI
	 5C1MngXOLAHB468OQ2H0017qEIqYWrxLWZJQotkU=
X-QQ-mid: zesmtpgz4t1779449175te4f3fae4
X-QQ-Originating-IP: Mbr/bW5duuFzrge2MVl7tFpLMVUsqkao2DoNemluwGw=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 19:26:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1712237719727841820
EX-QQ-RecipientCnt: 9
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 19:26:10 +0800
Message-Id: <DIP633RAN8PQ.3CCYARBCPZ1Y2@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Linus Walleij" <linusw@kernel.org>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/4] pinctrl: add new generic groups/function
 creation function for pinmux
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519-germinate-ageless-631033d22797@spud>
 <20260519-storm-karma-e457ea68904a@spud>
In-Reply-To: <20260519-storm-karma-e457ea68904a@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OK/duGulb+LdcRRoLjUQXebGMLgxBHZHgZ7E4OdvXrZxjy5ezwUkiz4A
	JXQPqh1viePtlGWTJN66gVO9v35FsRIBqlcgwd+lPJ83jBEb64MOXcWD47IEnWIGD1SAtq1
	ZR/MQ/DhLfZTGRHgY0IQLb6K+kY/ebg1WQx0Nd4tHZkdgujpSmgO4y1nCMrtmGMWzCoAnPg
	o4jF2pR3/9IRglVpmJ9AeWfXKgeZclkD8T7Y8ze0XPRRIQ1TL5J1iD+D7fcA1G3xLm3SCep
	cIW54/AFj4sEkatxOyaP0S6e59R6++eMvP3rxYx8Q3ndCSiKtTQD/FSgQuefH7m/h+zNj1V
	sD8BJd2pWPagndLY8PaldC7NG2iUmAQgMxlWhhB+xE5CsBpIh0Ar+2nAKIFHIGDVzz/06Io
	qO6TAjELFq6lxH9nFtKWBWnJj5ikOKT2OyzCohJlz9qPkmX8imXy+qEjfif4oAGb+g87hY5
	4TRBuFTkITfjlGtQ6yzuCr6F9J/zij720h3foakliNOrp+BG3QFW8psXqr9W3ICT3HD+XMj
	4u14gshOXOYW37lvCSrIAvqZQ23Uluqe5G2/h4iLBygWYQQUR80amjpH8/pdq6ggW9+sIz8
	jtSu+I3bZIjwroxGvJxRJ/OVNXpSDkIuQhbhzOmDIERkOP8LtIsbw/jFoLvl31QLtA5c6x5
	kabmlbA1Gqc2GfBhpJWnrsdZ+julfZCNiKXpfGW4gwB163FLzo2iZ2DtZGHy/gtOI9SjzE1
	Q6FtI6j99QC9QOWj0KZsF3oSjjt0TY6EwLMhEmZGhDMPyiw6KeKJSwqpptsKmRoJ1B4qA/i
	PSizcUr56vXt91zr4H3Uczxi1fdo62q+ERB3HAGEXkGHOJKj4cYHicfbXReFM0PqpISY+pN
	3lk0eGAEDV+Y/ZKHf/KxQN7wpQy6mCeeT9RisK+xlTd/PsIpXVXBG6XGlhNvLOT30kzHDjd
	Q3Eger/beu/yWz9gkqu+b1Qwt0KwPPxblM4YkG3gXBwA2G+KKpCdt0dIti4ZvAVYSvTOSnp
	qvB/QgJ19jr3f/Z7WPtFgzQvrjb57kaSGhYfuF8Zq6t7UP5WJv7L7GXwU0oBw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37357-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[spacemit.com];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.992];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.spacemit.com:mid,linux.spacemit.com:dkim,microchip.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 43DFB5B319E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue May 19, 2026 at 5:37 PM CST, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>

[...]

> +int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **maps,
> +					  unsigned int *num_maps)
> +{
> +	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
> +					      &pinctrl_generic_pinmux_dt_subnode_to_map);
> +};
Nit: stray semicolon after the closing brace of the function definition.

                                  - Troy
> +EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);


