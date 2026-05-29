Return-Path: <linux-gpio+bounces-37705-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHNVN4n7GWrB0QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37705-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:48:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC32608ABF
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 22:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A6B1301626C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 20:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D83376490;
	Fri, 29 May 2026 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ac6t8HID"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7ED329E79
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780087602; cv=none; b=tlsEuhtGwnzrPDmTtmzL7KYxMXRoCpxqUcgLTmC4ql9QAuldWQbesHxdLIoP0V3X8cFgGPDFMLDpEFoHbECb7TY8yPfVyBGdj67j3tQyWmo7d46d6EPnL59+O2u94Qq/Xe0qsxMcvDeblbIM+pdBm9rH1T02iWrJ8fmbWxvczeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780087602; c=relaxed/simple;
	bh=Hu990MXFDmsHaml1m3y26LLBAUFsB4ATxoDsDS/egKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ga6HbeZlsKzzktceZKSWaoCNOT7f81YgfjToEaoz84zqNG7dO3NPgIhhshmSn2KlBZUGmNEi5R9UYxc6bLNrqt7ccRbJegTqdskyXj1gw41+HnFWOtz9B+Nzc0EzNpSfCfeRFJ527AxXGq4Qhu3VI/K4ctU78BCwWG0aqQ4Y/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ac6t8HID; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE411F008A1
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780087601;
	bh=Hu990MXFDmsHaml1m3y26LLBAUFsB4ATxoDsDS/egKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ac6t8HIDWIPDQS2t26VON6npElemBina3b7Pb3pWArkFEq6obvKdGtFMbjLItfppj
	 eppu4ZtIuO0L6we9kCEzXNHvMw2UaujMXtTVWG0fzMb9JPQberLiAHpmvcHobZWiGY
	 WE8ckH8hOOvoNIXHnsDIxWqP19NIRziLtNhf4S/7ydcvM3Umo0w1u96NKBdPOWejSC
	 SYE/nxcyVJM7UNtwpWaopomey2oI8zL22JXh3cei8YFwAcSif+iwmczTq+2tlclFbX
	 wIwYqzKRIZFinQl+AEehFOFzOf282Vaj41fFzJQ64kTWNzt8mn3EvMlCzWL7rCSU8R
	 1bAN4pm0YinoQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso219011e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hemgtIRk4dc/9fxf8l2UymbqU0wATzsgkW410Zu8AFqzrYUbWA6OsMcXQYkGJM12Ltmau7vY+6U7w@vger.kernel.org
X-Gm-Message-State: AOJu0YxTMbCG9L2Nr9hb/wqsAvbljBqvzxu5MLLnYWzFvGvudshAsmMf
	6TcY83TMKCYw+/qNi29ZV9bqFZdk8A7vsllT0p1XHh+1aIH/hQKE6Isr/7cT7EtQgW49VYBjpRb
	ZUpHAXZjy9hP6lKoWBaCdGlwaLt/UM9w=
X-Received: by 2002:a05:6512:b9b:b0:5a7:46f9:be3b with SMTP id
 2adb3069b0e04-5aa614260c0mr232192e87.14.1780087600222; Fri, 29 May 2026
 13:46:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <ahml-rVa2PIA5DDC@shikoro>
In-Reply-To: <ahml-rVa2PIA5DDC@shikoro>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:46:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLmWV9WizdqXfwvTUCbJDisurLBa7sAC6DH1BehDTHZDYA@mail.gmail.com>
X-Gm-Features: AVHnY4LikLXubPACR1IQvbYvGs8DVaKgCis8LOnURnh9gKeda2OwXHTi-bVfjZM
Message-ID: <CAD++jLmWV9WizdqXfwvTUCbJDisurLBa7sAC6DH1BehDTHZDYA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37705-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5EC32608ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 4:43=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> In case this goes in via some other tree:
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I queued the revert in the pinctrl fixes, you can take this one (2/2).

Yours,
Linus Walleij

