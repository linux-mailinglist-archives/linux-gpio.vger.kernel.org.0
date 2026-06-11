Return-Path: <linux-gpio+bounces-38341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yIGdIRqpKmpCugMAu9opvQ
	(envelope-from <linux-gpio+bounces-38341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:24:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8FF671CD7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:24:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lea+n4Mi;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38341-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38341-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B85A4302BFD6
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227443EFFA0;
	Thu, 11 Jun 2026 12:24:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C123101C8
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:24:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180692; cv=none; b=Kbmf9IxwGHXNQp2oxAUVmnHnPggwtrbanQr1RgfESW9wo3+hnGw4n10+85E6hwxqnRiHALb4tmfBzb9nTfGy5mBtg8Rek/+I8jwRaYpieBxzS0R3/Y0016SurWEUQ7b2uBYTREgBTafUYp0CsGQYIemmlP/8uKEfYKVP7KeWsdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180692; c=relaxed/simple;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHUIx4jeOYFt7dsLH/MXKwcFL6b8SGZ+9bv4YUE+87mXNk+jU3soui09uacY0noN+Qf5ejRNHqkoqgbHA0gGJHMSJSmA/TDnPfmm+DGyEo2bCOBAZ/Z68879+eOd/mKUp4SFdAXFYtkxEL+/vLUFuC5Pcq7urOwhCxKKgw7qvos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lea+n4Mi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB19F1F0089F
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180692;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lea+n4MiGpc3ia1zomqQ656poeaB1nyGP3gj0AHbZIHtnxSC6hJP/+2MBvxcwHaOs
	 CJl1LrUfZh6hYVUxDIUxOnWco4cZQGMA4pnP0TKgQGqRnC+P3mxRnlltRrVEhqNj35
	 YAFWpTh/PvKjJyH3wDvNuO19PCkG7DXO/um/Sm+9/sWpPuTNwWWNnP+E0j0aM3IlPl
	 Qj5Y9QPLfoMo87kmf557TQ9x89lm/WOHjCDHueUzZueNnSx4yV/78C8wfcosNkNLUL
	 3oj/meoKOPd6E46XzEHu0cm871i53XH1t+SlZau0JZ+53CMNRAX5ueYo+4iHp52f1s
	 yuhutDMf/+fyQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so7247051e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/w5LG+MDlg5blHOuWF/bbBSNg6XVCRK0u5pW+2ShlDPYYez8LZnYtfFo+qZnIlinpcXC4oyp6F85Jt@vger.kernel.org
X-Gm-Message-State: AOJu0YzUiWtS0bSVWiBmvZ4NnHRgoYQTiSF7KOcziJ/n8nT1TE9l5SkA
	TMgpuDW5h20jshduJAueMD21e9X8LFdyWVbCUe7bCrkDVkLeajfN/zF6Nl7LvZdf3NN1X7h5ILL
	3/9l+6rFJ95hhMGxtb+uhIdO3PBki+xM=
X-Received: by 2002:a05:6512:3985:b0:5aa:6585:1ba4 with SMTP id
 2adb3069b0e04-5ad27fb5d65mr737232e87.41.1781180690702; Thu, 11 Jun 2026
 05:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:24:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
X-Gm-Features: AVVi8Cfk_Nb67GqHhEaC43czvNZSfeYaRUO8eNFAOjUIKcFR1-C3mQUmgjkvIvI
Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38341-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED8FF671CD7

On Wed, Jun 10, 2026 at 7:29=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> This series adds the devicetree schema and the pinctrl driver for the
> DP1000 controller using generic pinctrl bindings.
>
> Compared with v1, this series is narrowed down to the pinctrl binding
> and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
> CPU/SoC bindings, DTS files, and defconfig update) are not included in
> v2 and will be sent separately.

This is a very good looking driver so I applied the patches!

If there are any more snags they can certainly be fixed in-tree.

Yours,
Linus Walleij

