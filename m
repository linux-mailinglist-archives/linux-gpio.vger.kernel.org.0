Return-Path: <linux-gpio+bounces-32115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGcpFaNpnWnYPwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:04:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AB184368
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D04A31218C4
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CC36920D;
	Tue, 24 Feb 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGPg96sA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDF3043CE
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923591; cv=none; b=bTH9/n8Agg8P/6gE4rf1N/6zJbB5lbeBNvN5liTXF19qa+UJ+5fxir+nqiH5fh2WSUIaeKDH6zLi4VvJKycFEoAbwMBCrLiR2i3MToK/xlpW0etiMZwX0VY5KockWJkzjbhTwt+o5d3AdOLb2uEgwgkKKt1JIvd8l47YgBzD+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923591; c=relaxed/simple;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwiwBcsd5jXWyBFUtDpSetvGwoqew1BXv0Q5qFLKCRkYCOm7gbIuxOHPWl1D+DJkbvDsZYzQqcGARLtYq5yxQRlmGF/ZuhlGzy2c0QjMGTD8wWLkARcoHFT0FyD3rB8D0dGMoacY3VdRTF+N7LANhc8S+HmiOGM0XzoNDBsIpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGPg96sA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6A3C2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923590;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGPg96sAODW7wqtA1uf+71Mk5aGsU9mJID4Vhqky/fq3t7dyRnKEejzEahlvF0kks
	 MwE2U9TbBg0plsvVss+faU5N9eS/irEtfP5XiyaQ+RuOiU86d1CLakBKi4WmtTPwVG
	 PDW8khAFXliQt0Y/o/dnjniaWha5/yarFbCzFR+aL9bmyOtPTGn5Ihj+tf2fcV3Wui
	 0PS6r6I2Uz+QbDCGgM4GPnQ5nYhAOClwQv5nmvxvqEXnasBKVvqcHiEMwDc6BOLmAb
	 5IRgSwEiFkc5KyUBLx7jdgKxgOwqwYypcymaPo7tezkrNul0u4ZK2MlfmeDIiav80p
	 mYnG7Fi2vnABg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79827d28fc4so27327767b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:59:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD8rjxasv36SiuJ5O+6uy28GLCc5kocxGx8daXf+guUGMeAbhsXMnQWMIMd+YEDl9UayCXBbulZ95m@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdXww/A3DUpb0nJnMcxgzQyOlhtfkczE+1VhuX/6rnXbY/2Yg
	Y4C2GuXs7UTW73MpmHvUOG9rUNSFw22NGEGaaRwoQWokaKIRUuzw21/RbinBrAsctUw0ekxXfDw
	y0eQtezoG8tpdg56+YsfsrBXbUf90p8g=
X-Received: by 2002:a05:690c:4806:b0:78f:a616:7b99 with SMTP id
 00721157ae682-798290172b5mr93654927b3.49.1771923590224; Tue, 24 Feb 2026
 00:59:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
In-Reply-To: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:59:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
X-Gm-Features: AaiRm53Vb4IAD6Sp1D0WlxQIdn1apde_GXyUgxJPFAFGQfJTy6x8-4GGpF2nJHQ
Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in aml_dt_node_to_map_pinmux()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32115-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2E1AB184368
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 5:51=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> The of_get_parent() function returns a device_node with an incremented
> reference count.
>
> Use the __free(device_node) cleanup attribute to ensure of_node_put()
> is automatically called when pnode goes out of scope, fixing a
> reference leak.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij

