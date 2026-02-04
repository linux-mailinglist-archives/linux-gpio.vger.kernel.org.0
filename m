Return-Path: <linux-gpio+bounces-31427-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN+KDaQhg2nWhwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31427-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:38:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBEE4A68
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E73A302712E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 10:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447DE3E8C41;
	Wed,  4 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqWKQBFc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882230F934
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201365; cv=none; b=lwDeMObSXNshQfTAiL9RJBBhstQqqlIm9gI5mOG7Brm7WPztzB/qcL+etZxMEmTmN9TxMJPGBtRIj2tT8NNGSMXug07PrXRWytNaJ1vMN9TfTdcsu6I1WiPQBf1RhG4sTndX7aRiwNNzpTnN7ZSwjUYhLGEuBOoT8im6GPH/Je0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201365; c=relaxed/simple;
	bh=ptoiRVAlZGzIJyLYt+jTEV9MYD0gUd7D7nxLeNRCiIg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GA7xdkexb4zz2v5Uit0at3ozonArhETfQPWiRGApISVytI3sB14/vk0pqbdYpJsdA+xyTkAnkazQUUMqwQOH+lw2sq4OYi76PXHsTebmYWFihyiZv6GJjUlKMhaULSEChJVWGwOBHtzcUSARY8QvFaa67V+LgwKPWkFqcNAnkCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqWKQBFc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06DCC2BC9E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201364;
	bh=ptoiRVAlZGzIJyLYt+jTEV9MYD0gUd7D7nxLeNRCiIg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=oqWKQBFcDJcd9f1QJy9XjVcA2AhXIvgR3hr3U79caPl44alCys5qm2+XEX3tgyW4l
	 V+/BErkKPFstKGNeY39aDWJyx7dJi/qgGt+mXizf87eKJmtjjJfT4YnIvmlX/8j3Rn
	 SdMaQYw/TrdP30BEfT3TjivfQXCLQQmxwQdFFgku8cjEzjqAJzwJFUEAqQ7kKIVdKX
	 /N0MkioTnzlqoDvPMK2w+bsxSgdDdfM1RzIPxdvKG+kH1MQ7w1RkDHZb0eeRvUuS7G
	 uqGOckrxqoHj2ACuXx6czvL6LAatrcNr0qsDVrNkNsnr+We6kmxk6lyyJ9cbHs7mmB
	 ELFLsYKx7VqyQ==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a1b4dd40so2198917c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 02:36:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVITCCR5egRkLduVK5OgotZaTzMShl4l8Qkx+/8ubcdWaZtzOT8UfFVcp4eKNLsGlaN9GQcm216mW+K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BV4ooPoQulbH6B983zT1TtCaMIuf07bbeawt9gQFvu5LChMT
	WjRPpxHOL9OPifaz7R8WPIgoFHfhSMF70XcEc0B7nq4BJg3BR63AcY3oOm8CIdYwWE5+pmq5lA+
	yit2kLOSoxO5moLXSsn1NzH7ONmXZlgcAv108qp+XuA==
X-Received: by 2002:a05:7022:1a85:b0:123:2c98:f6ac with SMTP id
 a92af1059eb24-126f477cf3fmr1038188c88.12.1770201364221; Wed, 04 Feb 2026
 02:36:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:36:00 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 04:36:00 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203061059.975605-5-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203061059.975605-1-tzungbi@kernel.org> <20260203061059.975605-5-tzungbi@kernel.org>
Date: Wed, 4 Feb 2026 04:36:00 -0600
X-Gmail-Original-Message-ID: <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>
X-Gm-Features: AZwV_QjU2SVHMmU9hsEFQVuFDP83BW1jovz7xlKNYthT1RHWjVgH8VnPNfzupmc
Message-ID: <CAMRc=McJjJNsrG7ZfWYQTBb2-8CgV4OVqZKhSFJDw=cTB0r=dA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31427-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CBBEE4A68
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 07:10:51 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> Ensure struct gpio_chip for gpiochip_setup_dev().  This eliminates a few
> checks for struct gpio_chip.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Same comment as patch 3. I don't like seeing both gpio_chip and gpio_device
being passed to the same function. If you already dereferenced gpio_chip, pass
it on its own and get the address of the associated devices from its member
pointer.

Bartosz

