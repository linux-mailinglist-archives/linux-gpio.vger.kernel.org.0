Return-Path: <linux-gpio+bounces-39023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +UREMoBHPmoeCgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:33:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641A6CBB98
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 11:33:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=G90fkQMu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39023-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39023-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C8C430A2907
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E873EA955;
	Fri, 26 Jun 2026 09:31:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE633E9C3C
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:31:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466279; cv=none; b=DnLUeGfcSt2+TgML8q7KNoJ3wMZeqAIZ93v2zO8FECELZN+szISYPYWlRuPP1oqIv00VIYSUwd1JyIAbJ2azlYkG32IkPxWPqvJDhKkvWSusBPqW1cpZ3xSz2UK3Zv5TGlCEWfCekgPCRjeT5bap1Fpr7oS9R+ghjdt+emRa6gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466279; c=relaxed/simple;
	bh=rpux6yDT16ic0wS3/2Ry77dxAooCngnSjhcLkmuwQiw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDvua74U3Ft4OrUVnyjTI3rp4q2MhMSzqGR9chMoThRvTZkmcxWqrspsZoh1jeOg/kvBwpclVslwQd8w8gWw+G5PDy1/dlugy7xMQ1GJ9d30MtX1p74uBUT9IP3s6z49jARBqa6PudT4txjyP+EHYjGju8SdRgB6eS9p8gOobA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G90fkQMu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333151F00ADE
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782466277;
	bh=rpux6yDT16ic0wS3/2Ry77dxAooCngnSjhcLkmuwQiw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=G90fkQMuun1t/Wp6zxYOeg/D7HZpVsMjn2FtnyT08x7T2P9fKKpfMiKyVFCjjJEBS
	 Hig6i16MdG1odZcB4+x6A2/k0sSgT9JLL6kJYmNRbi0ovj6S6U/95H0JPruecT/nzg
	 GMLo/fiCJUZwUmKeZiNuW0TqlXkPl+EUcKMy2wfAj15asrA54TtrLgsbw6d9OUZX0S
	 PBRTwPDpQqTm+0YQdVTlhqOJfvV4P1xZo61IESQB8uwQARBjReB86geB9bm1X4/Xwk
	 WYTjJauAiiZDs3RWrF1oBz7lq9ItbvNMff0EeXgbfY4m1CFfoGfdloe9mSRAE+dBE5
	 UnfVQGI8Eh+Zg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad578c49afso711362e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:31:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqE0AmhHI7dvhfM8bBhnIwToNPIVChACNThPH2LNleUyx8TU8JWQu82L6zN3h2fP3g+BOcZFST44yrd@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKuQVie9P2H2I5OXT4pl97OR81qIMxZv98NNpeF2rSStYQDBz
	1KZlDQq7qYXEn4i1zNMkvm0w/SuG7DRup2I6z/9A0zlNIQAEu9aFQjHIzLDCt35JgpMJtQ7Rn45
	TXwrVDMiSpMT64jT7GHl02lQREuCtfHmTixO7rP4U3Q==
X-Received: by 2002:a05:6512:70:b0:5aa:6f89:9378 with SMTP id
 2adb3069b0e04-5aea1f4cc51mr1390413e87.33.1782466275655; Fri, 26 Jun 2026
 02:31:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:31:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jun 2026 02:31:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-wakeirq_support-v11-1-120fbfaebe59@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 02:31:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MenARGtsG9EhF7zVgcOeQGAYVRZc906j4tBDHQzzsc0hg@mail.gmail.com>
X-Gm-Features: AVVi8Cf30tKZqffjS3ZAp3xIi5Kv5KtWMy22eC3tfJBlDmG5o9u1ykXsqyuQesk
Message-ID: <CAMRc=MenARGtsG9EhF7zVgcOeQGAYVRZc906j4tBDHQzzsc0hg@mail.gmail.com>
Subject: Re: [PATCH v11] PCI: Add support for PCIe WAKE# interrupt
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39023-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:quic_vbadigan@quicinc.com,m:sherry.sun@nxp.com,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:mani@kernel.org,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:bhelgaas@google.com,m:brgl@bgdev.pl,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6641A6CBB98

On Wed, 24 Jun 2026 13:25:49 +0200, Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> said:
> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
> two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
> hardware-only mechanism and is invisible to software (PCIe r7.0,
> Section 4.2.7.8.1). This change adds support for the WAKE# mechanism
> in the PCI core.
>
> According to the PCIe specification, multiple WAKE# signals can exist in
> a system or each component in the hierarchy could share a single WAKE#
> signal. In configurations involving a PCIe switch, each downstream port
> (DSP) of the switch may be connected to a separate WAKE# line, allowing
> each endpoint to signal WAKE# independently. From figure 5.4 in sec
> 5.3.3.2, WAKE# can also be terminated at the switch itself. Such topologies
> are typically not described in Device Tree, therefore it is out of scope
> for this series.
>
> To support this, the WAKE# should be described in the device tree node of
> the endpoint/bridge. If all endpoints share a single WAKE# line, then each
> endpoint node shall describe the same WAKE# signal or a single WAKE# in
> the Root Port node.
>
> In pci_device_add(), PCI framework will search for the WAKE# in device
> node. Once found, register for the wake IRQ through
> dev_pm_set_dedicated_wake_irq() associates a wakeup IRQ with a device
> and requests it, but the PM core keeps the IRQ disabled by default. The
> IRQ is enabled by the PM core, only when the device is permitted to wake
> the system, i.e. during system suspend and after runtime suspend, and
> only when device wakeup is enabled.
>
> If the same WAKE# GPIO is described in multiple device tree nodes, only the
> first device that successfully registers the wake IRQ will succeed, while
> subsequent registrations may fail. This limitation does not affect
> functional correctness, since WAKE# is only used to bring the link to D0,
> and endpoint-specific wakeup handling is resolved later through
> PME detection (PME_EN is set in suspend path by PCI core by default).
>
> When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
> bring the device back to an active power state, such as transitioning from
> D3cold to D0. Once the device is active and the link is usable, the
> endpoint may generate a PME, which is then handled by the PCI core through
> PME polling or the PCIe PME service driver to complete the wakeup of the
> endpoint.
>
> WAKE# is added in dts schema and merged based on below links.
>
> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
> Link: https://github.com/devicetree-org/dt-schema/pull/170
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

