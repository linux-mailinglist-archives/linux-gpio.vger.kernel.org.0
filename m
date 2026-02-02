Return-Path: <linux-gpio+bounces-31358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I3KGQc6gWmUEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 00:57:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9E6D2C91
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 00:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2232F3006179
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 23:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2732836214A;
	Mon,  2 Feb 2026 23:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NacqR3E7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51F34CFA1
	for <linux-gpio@vger.kernel.org>; Mon,  2 Feb 2026 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076675; cv=none; b=kyzjrGqrEOHpfYHc2HqFaOJj9ObbIEk/Tme9t59TtGXbU2Gtdrj+TpjMcICR8c2u3J8UQyqj/DFrq2h6LAVPYEgGb29jZ54E5RgA2FyECGJ8AjtG+RnirwMZs7q0vCQ7ajI0jHkWdunFK+gKM0rXfEYJblEB+Qf3igmq//2UfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076675; c=relaxed/simple;
	bh=VP5eBy80DfwsxhhezeHv+8qj6aCxZIPa33owLDaWO4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cpal/JMJTH6GvaFC9iLUVDYRPLlNUf0tyXYKrdTOLM4QLRMNSJlYMKAYs39Zmv1wY/H90rKCGYexjtAkvDgC1Bvn1Jxw2+IYo3xym+v7kCCMjdsr++YbyOntNgO5TkFlNKOkLlgc3nH6cf2JE8iAsW8xoGEvf5BTW3cKk4cVBJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NacqR3E7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8AEC116C6
	for <linux-gpio@vger.kernel.org>; Mon,  2 Feb 2026 23:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076675;
	bh=VP5eBy80DfwsxhhezeHv+8qj6aCxZIPa33owLDaWO4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NacqR3E7dVGIqobCVS9Q4ERjCTxkQe81BF11IkLjUofO6+8ESZ8Gl8KGKoyOU0A1x
	 dmP88pLjNjlnNL3y+sXITv+Jwrxq3p0wG/PdFtrYqZtTZc2WMleRZ8kpv1w5FjRStQ
	 BExx6NUiviAlZAvn27huhrnEYpTn33fp7xdk7p99NTiTFnfNciCnyGvja6ZVnUr/pX
	 b4ChpaQ/bstlNKoj7DC22fjUVzmfOQhDXE7Q5hUzT6JlRSceZGr+2Fuf0f/Lqin+zu
	 Bkzlsl10NP7Qf/uR8N/wfEPWCUNdcxi/lqFV9LXQGZMlhhg9KSMwbhWIpUTBZgDIGu
	 wE96OghKGGEsw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64942ebf1a3so4611529d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 15:57:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhe7cVmD0BD8eV666rODRINSMcDx1u9ZRnL+HCk2wK4hyIOES5Up/JPxF9ltJRxBwB2cUkMI+2yNKw@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9KVo7A47+9zpL84QgKKKoNErfkVdFQX0E8s6GL18gaOziC1q
	g5SIbhJ325zmyJINMoR62wazB/rSWUuuSIqrRcwm7lzZ/aNe4wMGBsq+XuveQ+rqJjeN6zWXN5f
	+NLdseuPy8WVgf0N/RF63Shx4EQ2qd04=
X-Received: by 2002:a53:b4cb:0:b0:641:f5bc:69a6 with SMTP id
 956f58d0204a3-649a84f8e6fmr8477791d50.84.1770076674898; Mon, 02 Feb 2026
 15:57:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202095809.1318785-1-arnd@kernel.org> <20260202-lushness-drier-ae0e40b56eee@spud>
In-Reply-To: <20260202-lushness-drier-ae0e40b56eee@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 00:57:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=VQu3Z_H8UeKF+qNe8EQY2AViJeONjK2Gw1c7bL2ixHg@mail.gmail.com>
X-Gm-Features: AZwV_QjiuICoQDTLGfFWtlrQ7SMxzVECDPj32eruVRb40bWgC4DTPeFXEma3Qo8
Message-ID: <CAD++jL=VQu3Z_H8UeKF+qNe8EQY2AViJeONjK2Gw1c7bL2ixHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: polarfire: restore GENERIC_PINCONF dependency
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31358-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0B9E6D2C91
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 8:53=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> Does this show up with
> https://lore.kernel.org/all/20260130-stoop-gleeful-29f2c525bd48@spud/
> applied?
> I considered what you have here, went with what I linked cos it matches
> the other pinctrl core options.

I've applied this one now.

Yours,
Linus Walleij

