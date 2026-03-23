Return-Path: <linux-gpio+bounces-33996-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCMbC5YBwWlUPgQAu9opvQ
	(envelope-from <linux-gpio+bounces-33996-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:02:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C21392EE9AD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30FE830071DE
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 09:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879683859D9;
	Mon, 23 Mar 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8zNE+mF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49488382F0B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256528; cv=none; b=CnXdCgVIVB3rRUCzOyohMS5Lk/xJbkIJnH6JQ9DHUauQXxTHLtEEvSV2mmfM/IPjwniEDiRk50117pUOn0i7+1VvoW0DoZMEhrwQounI43arkVqh0Mby2MkEK0qnqQP25MHsw0tBncuyA6VgATckWpEIuYKMeuUPBGr6OxajI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256528; c=relaxed/simple;
	bh=eE5g+1WMrIl/FHufSMBITJlni5GhlGpGfBqj9cDGjlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzB8MMKZfCr+EhShqBnDT5Lyw2srCioVOhZdqsZQ3LKCuoaX/acvhL5j46mQ+m0MMqbKIbXbN/SiQWbdMXGig8ULGHI4d89bkQ8GlFqHX+hGuk4N4hzYa+GjyH0FZK9WwtQL8flh/hB2GAQa+gT2FmW/EBs8zEmRzm/JjEF7K6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8zNE+mF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F047AC2BCB9
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256528;
	bh=eE5g+1WMrIl/FHufSMBITJlni5GhlGpGfBqj9cDGjlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P8zNE+mFm8fxvzeoe+w492qZUYLxiZZVPzFsg2DREdO+GF5gzrmb69c28Xykrkdu5
	 HEb1GLLRAG+RHALmQgGZHRFCU7ea43cz9Ro5i2oDEmaAzO+SsJBNyO5HUhhWzdhLTp
	 azgZFm2aizimuVkw42MDk8uQJ8p2XP/PfQAfYtP8uxM4+762xJZ5B4aFE/1bh5WaCs
	 Msut6Cc9Yx1DpFk35hMw/df5uiCjv9THqOVHOUtbeMSCRXEJNFCBQu5yCX71XTbLKk
	 0LlvbAjVqXFzgD+M1JqUSsH9cs7xW8BZlhIxwtZlSnGmkH9HjSnWtN92pdJ05qQ42i
	 UFXvrrkpdEJ+A==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64eb8ceda8fso1691874d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZh1qsb7Z+doF+iPyMLu+l8A/ZGzdzbLVUlaj00e9Ob4pnxrz4BZ4RRyEGbpTu+95QMbMKzFo/rVGk@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwlbFUAt7IlBXx75OD57IZYmhuUEtx79K4FFSzOgHXVyOLVYP
	2eQSFaiwGsAnpRhx0UEnpr+wv97SjSQ8SyAuMrw41svNL/bhmu10nAbzE5ccqg6zPz29dgMlL1j
	t370mbam1+O+fdVD5gYUYk9i/YXJgkSM=
X-Received: by 2002:a53:b605:0:b0:64e:9e77:f950 with SMTP id
 956f58d0204a3-64eaa6df84fmr9321180d50.29.1774256527153; Mon, 23 Mar 2026
 02:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
X-Gm-Features: AQROBzCzwKV1FvnXp_2c75F-p7Yqf5gvJiSeAyIUKrt-md2cTLWACh1gS9JGfIQ
Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: realtek: Core improvements and RTD1625 support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33996-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C21392EE9AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Yu-Chun,

On Tue, Mar 17, 2026 at 12:54=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:


> Tzuyi Chang (5):
>   dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt
>     property
>   pinctrl: pinconf-generic: Add properties
>     'input-threshold-voltage-microvolt'
>   dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
>   pinctrl: realtek: add support for slew rate, input voltage and high
>     VIL
>   pinctrl: realtek: add rtd1625 pinctrl driver
>
> Yu-Chun Lin (3):
>   pinctrl: realtek: Fix function signature for config argument
>   dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
>     description

Patches 1 thru 7 applied to the pinctrl tree!

>   arm64: dts: realtek: Add pinctrl support for RTD1625

Please funnel this DTS patch through the ARM SoC tree!

Yours,
Linus Walleij

