Return-Path: <linux-gpio+bounces-39193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3ejKQmyQ2pEfQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:09:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DAD6E400E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:09:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AZCGQJV7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39193-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39193-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F210030D26F5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 11:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA5404BF3;
	Tue, 30 Jun 2026 11:44:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D25401A26
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819844; cv=none; b=C9HcN2Iy4MORnGjlVQYZtSlxdQNM8gHzUP0N25fFh0eRse+hajKsCqsRYdwTmLkEJ+vtrv4vmg8Fa+SjWlq/c26TiDQIcaVzKOSsODCeL5nOJL5YzrfAb/7E1bYu9MvK4CzFB9R69eVmkd+Duct/aZEhSxcil+LlCsr4PWL5OVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819844; c=relaxed/simple;
	bh=W8yXFKvwNj8QS3dUv6tZrcTUl/bEEEJbwmy1a18FlVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1PAi+YxyzOM/1Z94bqE3VZ4ir1a7FRtvWtiLLKr4/2dXmYgV9XaW4grvUICSMHDR4WRzKZjWm+7wSEM3OyqKNAITCiIejJM0d8gMIDocHVEXV6x58MvDGC5nxzwhc40eBwO+fJjlcKjJQJWMzfzbw0/By+Zva6bLAfzi0GoMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZCGQJV7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DEA1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819843;
	bh=W8yXFKvwNj8QS3dUv6tZrcTUl/bEEEJbwmy1a18FlVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AZCGQJV7UOkLrNWP3hWTN74vYBGgXhr074t1TTnjnM5u88GE9O8vW54ZKt+VlQQUo
	 HCcdzTZUjX8OafFknJd846s2Auxzxg3a/Pnd2RUnAFIUxtPVWTrF861irfANwK5G2/
	 fkic5ynaNHuaxSdNsKwHM17SESOtOgEAwL1e3VuQ/AWk0zeKNq8N3YIck1RbKGQUPi
	 8XTJEERmf9zTFs6fcrz0hwwMeKxE6xxaFxN94M+IOXnUhetnNjDWbn3dwpHrwiH3GW
	 vAD9fyT9BfgMLnGyXQN33G1zA6SzXql3MLHdl/govOIlDOHiaZXLRQwxl+d2w2t43R
	 sdq7iD+UGsM4g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1846433e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 04:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjYIs2jj+SIwGCAJOaDqXbDBGvQAoJyGrUpwOQlFSIakLnLS003S2zbgYR7Sf0CHUuOgnrh39/KYgS@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrL6h52iFLfyLZASYZu36t0MkJcffqFbD7E8PdJgZZ96l4m8q
	KCMg8xNuz+tLdk0WkBPm5xrv8gDH7UaWpaKAJbZ0qr1434K6zb7csr3GBqrF1ll6hiiVxjdxvv4
	49RMu/WHuagt+64HwZgLUUMYyXxO4tM8=
X-Received: by 2002:ac2:4f0e:0:b0:5ae:ba7a:1789 with SMTP id
 2adb3069b0e04-5aebdb7d889mr791136e87.13.1782819842431; Tue, 30 Jun 2026
 04:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
In-Reply-To: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 12:43:48 +0100
X-Gmail-Original-Message-ID: <CAD++jLkURjnQa44bWAy0E5EG0t8f7kAvQsG2S_Jviwv8LGaL_w@mail.gmail.com>
X-Gm-Features: AVVi8CcYfeqj6YwfcYV_eKNotXa_k8YSs5lPlnaztoOTJAVOIQtv8kQy35rHWaU
Message-ID: <CAD++jLkURjnQa44bWAy0E5EG0t8f7kAvQsG2S_Jviwv8LGaL_w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39193-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23DAD6E400E

On Tue, Jun 16, 2026 at 12:55=E2=80=AFPM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> GPIO interrupts that are wakeup capable need to be forwarded to wakeup
> capable parent irqchip. This is done via writing to it's wakeup_enable bi=
t.

LGTM and Konrad has ACKed it, Bartosz will queue this patch if he's
also happy with it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

