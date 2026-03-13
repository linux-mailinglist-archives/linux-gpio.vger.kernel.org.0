Return-Path: <linux-gpio+bounces-33370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMT6NkgZtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:03:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B723284752
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A347E3316671
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB8339B95C;
	Fri, 13 Mar 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlHHHOwu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FB39A052
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410143; cv=none; b=Lsl7lRaKTz70YkLd5TiDjgdrMwKVLc1NDRO/w4e0X4/OEt1ACZsH13KczRP7lIDrufmFk+QwSMBHDzwY0LyYo43cseu8k6YpPaLedRdkgiphVSKaNoWAMvtdYVga7VZw21tA9gCZhrQRO5mDe+VsJJrEnzVvKCib7TmaaoB7C80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410143; c=relaxed/simple;
	bh=kBRAddIXHUXh1NrMwwK+Q3Uc5sar9/R6FymD2E+StZk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7UoJ/VjSIC67TDDvYB3s/6BUX1/XMKFGFOfP8qrglB8WMkGb8eBgKlycWg979/Fs6jaEm9PSTwvKEET6eZ8dO7EB/+CtBjIFzimqdXF6/yzs7U3Ziwm5qqa60p1umPEObDL9HTM3zDLMZpXFd4uS/GcIQSdRoUdAhef3itKZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlHHHOwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A1AC2BCB5
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410143;
	bh=kBRAddIXHUXh1NrMwwK+Q3Uc5sar9/R6FymD2E+StZk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=dlHHHOwuas5iEiZYDfllPvgOC3GmZN4gPESsU/pK/+/y9TjVAYFpmMYGAY4asjiDj
	 OoDUnUSYn9XGzH8WIe9LxrJOqv1YJ7ddkpm/AWyvge/Zh06BQaIg0neSOIgTdWvhJy
	 G3rwOYAIIQdEal9Ge0wVjM9uE9huzivT2drwH7B+fk0ttJGXKv74xEgx3NfXX3wT9J
	 vdb3miCRTZ8mz0FcEpV6WcY863bmBN/B6vqKhdlha8kD84tkO0dhDV//tCFLaNSUS1
	 uJkeB7MV6c/iJxvcA73YH+7Zq307wQdPgQBLcDe0Lrn6hVoUI8GLz5SA1bqc0zFikO
	 q8CGGmE0LLY3A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a5584e31fso26575451fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 06:55:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWXEWQIgBO93bwFcMBtLU1mki8G3diqnNwakkar0k/shLlHd7UesXmS67FzVbPRgc0X5yCuVFxLX44X@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GFPLivfkgZ/TZNL7dCyT7Rukuy6wODSFF+S/9Ja3sempm2ym
	HggMBh+vkqJp0oBxti+1SPpVW0iJMn+fuv0gRYLo2hH1n9z2olhHpJGomiI5cMcSibt2SRPHj48
	xcQ8S0kPhtOGcZdceGHbAizTEfZ1mnh4Q+HKhH1ZCnA==
X-Received: by 2002:a05:651c:4417:10b0:38a:83f0:541b with SMTP id
 38308e7fff4ca-38a83f05651mr14520871fa.17.1773410141391; Fri, 13 Mar 2026
 06:55:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 06:55:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 06:55:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260313-wakeirq_support-v8-2-48a0a702518a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com> <20260313-wakeirq_support-v8-2-48a0a702518a@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 06:55:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md3MK_YUPxx3rh9dGOfjBBxMBT1MNVAT-XZd=kD-qQj8A@mail.gmail.com>
X-Gm-Features: AaiRm53a0ohWjYAXC_3b1_a1P_9x823vkvlD9HHudwcsHk9RyRRh0D6CSmM68NE
Message-ID: <CAMRc=Md3MK_YUPxx3rh9dGOfjBBxMBT1MNVAT-XZd=kD-qQj8A@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] gpio: Add fwnode_gpiod_get() helper
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	quic_vbadigan@quicinc.com, sherry.sun@nxp.com, driver-core@lists.linux.dev, 
	devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33370-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B723284752
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 08:08:41 +0100, Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> said:
> Add fwnode_gpiod_get() as a convenience wrapper around
> fwnode_gpiod_get_index() for the common case where only the
> first GPIO is required.
>
> This mirrors existing gpiod_get() and devm_gpiod_get() helpers
> and avoids open-coding index 0 at call sites.
>
> Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  include/linux/gpio/consumer.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
>  }
>  #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
>
> +static inline
> +struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
> +				   const char *con_id,
> +				   enum gpiod_flags flags,
> +				   const char *label)
> +{
> +	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
> +}
> +
>  static inline
>  struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
>  					struct fwnode_handle *fwnode,
>
> --
> 2.34.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

