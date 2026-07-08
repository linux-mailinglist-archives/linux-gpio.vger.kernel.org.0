Return-Path: <linux-gpio+bounces-39656-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FADaG7A2TmqJJAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39656-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:38:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45D725EFA
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 13:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jubsw54k;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39656-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39656-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B03930546A4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 11:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96399433BD0;
	Wed,  8 Jul 2026 11:36:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5042EEA2
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:36:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510569; cv=none; b=p/ziNlVuuF38gfznmx0gAo3QIOyZWyih8ELLSRhewXGoqXrvtlLB060JXcSjeszGnI+lHzmuZLGrYGVG1HbNHlsqwjOCy0pTzzQ+lWW1+Z7v4hDq1CUf4sgv8mtR06GJI798SSm1luZjtNVLp2eWQetvpktMUpqfFC8X3iOozNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510569; c=relaxed/simple;
	bh=7/rcNDUSa1dXDw7IONyqkMuj9L8KQzOfslnJi+BczBs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlPsnDhf7LS8VZ5J3FPicLXapCbJjpm+s4RcsEcS1WJO5ghNoTx96D1xWKK5R1y31I46cgh2HPiSH6jgnMlgVBfvNc60ha3GA7g74yzHJBIHv8sl5Tl3aIxD5xQYXxijzuyeCDC7jqJ1mH6XtGOIKVUbEesYrgiHznYsmM8eR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jubsw54k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2047A1F00ADE
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510568;
	bh=VJqmVkipn9LS5P7QGj3CtnPtrgKv94L3h9lYbmlzwUw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Jubsw54kDR27sWbSj9dUqkbKXgNxC91fBonXo1MhKc1+a7dUaZ6iYUqdoK4nbeF/R
	 d5UxICS9BwycYLDv53TebSDts6WzFNgkKas9Jo4BqfCp/3R1CZQRKOwla5ZXdstcu7
	 2hOi/gtguSYnLSPhXrmslk8pl8N9ufYs7T4tNObqTZIJqWBsqg2nAMl7j0ORObShld
	 nXg1tcb/f3REvwgaxBz3iXyJ/Ouh5tgnpXVm49YtqLzK/UvygXzn7lESTWDFUQOCPu
	 Z76eT8EmUFSrnWuOhnCtdXmV0fYh/85uufKtlOcw7iMJDI2UvTRa7WhEqiv+mgDGOM
	 K2BtfrB11uLug==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b03d41976so4777051fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 04:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHprfHToIBmt863g9vNOSSER8wCtCzWPJTUwZuSqXzT4dpQYh9cGP7EFlbddZS9dIhksgeWWJE3qq6@vger.kernel.org
X-Gm-Message-State: AOJu0YyTk3fFYGfHuiYrGhUckhOKrr1vsaj8OZY/5VJYAhSVwl0VVZSv
	pAZtXqNN4fFStjuThA7+XpOlyxhzPaHQg1WYGu1yuMmGyLEbmWWqVp5KgPTYLdZkzbkyJFqdeKs
	cvN9E2Otn6jnQoOqQppA9mwR4BnbTANFujTRV9zW0qw==
X-Received: by 2002:a05:651c:2220:b0:39a:fffc:ccac with SMTP id
 38308e7fff4ca-39c799ff7c0mr5084711fa.35.1783510566653; Wed, 08 Jul 2026
 04:36:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:36:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:36:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com> <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
Date: Wed, 8 Jul 2026 04:36:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
X-Gm-Features: AVVi8CephY5s0HC-Zzpi16U-IPSPutNk5n1kFwIKZoryZVIr-16Wmha0OSORi0M
Message-ID: <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39656-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shankerwangmiao@gmail.com,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC45D725EFA

On Tue, 7 Jul 2026 23:16:31 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> From: Miao Wang <shankerwangmiao@gmail.com>
>
> The reset event of BMC is captured through GPIO. However, this driver
> bypasses the GPIO framework and directly accesses the GPIO controller
> through the fixed address. When the same GPIO controller is also
> exposed through ACPI and probed by the corresponding GPIO driver,
> there would be a conflict between the two drivers.
>
> This patch will try to find the GPIO through declared GPIO pin in the
> _CRS resources of the ACPI node. If no such delaration is found, the
> driver will fall back to search for the correct GPIO controller and pin
> according to the fixed address and pin number. A possible DSDT
> declaration for the GPIO pin might be as follows:
>
>     Device (BMC0) {
>         Name (_ADR, ...) // Match the PCI address of the BMC device
>         // \_SB.GPO1 is the ACPI path of the GPIO controller
>         Name (_CRS, ResourceTemplate () {
>             GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>                      "\\_SB.GPO1", 0) {
>                 14 // 14 is the GPIO pin number
>             }
>     }
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
>  drivers/mfd/ls2k-bmc-core.c | 162 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 115 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index f87224105b3720cca97dcef089dad63fe57bc8c2..7187b2dfddc3acfb9fdf3cb3b4675299928dd03a 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -26,6 +26,9 @@
>  #include <linux/stop_machine.h>
>  #include <linux/vt_kern.h>
>  #include <linux/console.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>

I've stopped here because this is a legacy header that must not be included
and none of the interfaces in it must be used, as per the - very loud - comment
at the top of that file.

Bart

