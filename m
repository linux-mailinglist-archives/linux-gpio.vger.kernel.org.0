Return-Path: <linux-gpio+bounces-33590-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALcNGI0CuWmEnAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33590-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:28:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56E2A4CAA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC223032999
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 07:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCD438F22A;
	Tue, 17 Mar 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RslkB4NJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6A38CFF8;
	Tue, 17 Mar 2026 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732374; cv=none; b=i17YtOWfpPBGLmCX5c+Qh1QEof8uZhp/oBUaOoq4lq8pR+GBofIHxWtw4RZ5xxJCWzbdx59Sebf9lzaYizR5YMiC3L+N9nEH98bwIuGIz3FCtK53vbWzubonP5wJzuwaR/Tg2VWx/ZMp9NDlCLT53vMl2uYRDhnyxUAUNx8VZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732374; c=relaxed/simple;
	bh=mNqvJDKHyXiTa8kul3MGyMaf5OVXv6+qsssX/KV3fuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXM3bjotxGUDXzuxhRzIyMg5f0/dYsm3ZCNgIcfn0CtvZd/DmA7/NuFg3wEW/vFz1BVuaX3cIepBxesFRaZI8+D4uNRtm/BMWKcibI2AqHjpeXDBpMisrQCDDUkswhcXNbhZM21yTDvl3YLsLp5YmgxSrwbLj4bibf4mGY3DunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RslkB4NJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B48C4CEF7;
	Tue, 17 Mar 2026 07:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773732373;
	bh=mNqvJDKHyXiTa8kul3MGyMaf5OVXv6+qsssX/KV3fuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RslkB4NJgbnLbXzvVE942uVUDJx8Pgq/+YQV5qIUmk+sME2OKnjh4wF7luqJJtxds
	 oYbh6kg8hPf7zFvyIOkWiP5CeoamoGi7CWuInj5xY7k0QZBnEOnFVhLo55VmwkcBZa
	 SzEAmYZfwn95GbWE6s1PWUlDc3VM8NUBKZ1JMexN1U3VHMtfCqXvDTn4ZY5zLclhNU
	 0sP9CZvoPj53S0c1zuJpBGgFxarId0UwNaymaovsyQquMjJEfup4DIJY+DVZU0P1Jk
	 t6ASUjrNLp0jp66zTMhVEyVBFx60N90FEsAVWXHiOFbtUgzvRiRdZCgXpB9xT1NceX
	 8j+/844jXBIiQ==
Date: Tue, 17 Mar 2026 12:56:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com, 
	sherry.sun@nxp.com, driver-core@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/3] PCI: Add support for PCIe WAKE# interrupt
Message-ID: <4n5heks4oymfz75wiajyc5zuzzulmwyfj2couudbi7gi67h2rk@smpnmyhdjkns>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
 <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33590-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B56E2A4CAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:38:42PM +0530, Krishna Chaitanya Chundru wrote:
> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
> two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
> hardware-only mechanism and is invisible to software (PCIe r7.0,
> Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
> the PCI core.
> 
> According to the PCIe specification, multiple WAKE# signals can exist in
> a system or each component in the hierarchy could share a single WAKE#
> signal. In configurations involving a PCIe switch, each downstream port
> (DSP) of the switch may be connected to a separate WAKE# line, allowing
> each endpoint to signal WAKE# independently. From figure 5.4 in sec
> 5.3.3.2, WAKE# can also be terminated at the switch itself. To support
> this, the WAKE# should be described in the device tree node of the
> endpoint/bridge. If all endpoints share a single WAKE# line, then each
> endpoint node should describe the same WAKE# signal or a single WAKE# in
> the Root Port node.
> 
> In pci_device_add(), PCI framework will search for the WAKE# in device
> node, If not found, it searches in its upstream port only if upstream port
> is Root Port. Once found, register for the wake IRQ in shared mode, as the
> WAKE# may be shared among multiple endpoints.
> 
> dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
> device and requests it, but the PM core keeps the IRQ disabled by default.
> The IRQ is enabled only when the device is permitted to wake the system,
> i.e. during system suspend and after runtime suspend, and only when device
> wakeup is enabled.
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
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/of.c       | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.c      | 10 +++++++
>  drivers/pci/pci.h      |  2 ++
>  drivers/pci/probe.c    |  2 ++
>  drivers/pci/remove.c   |  1 +
>  include/linux/of_pci.h |  4 +++
>  include/linux/pci.h    |  2 ++
>  7 files changed, 95 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 9f8eb5df279ed28db7a3b2fd29c65da9975c2efa..b7199d3598b31b62245716c178a5a73565efc89e 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -7,6 +7,7 @@
>  #define pr_fmt(fmt)	"PCI: OF: " fmt
>  
>  #include <linux/cleanup.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
> @@ -15,6 +16,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include "pci.h"
>  
>  #ifdef CONFIG_PCI
> @@ -586,6 +588,78 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>  	return irq_create_of_mapping(&oirq);
>  }
>  EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
> +
> +static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
> +{
> +	int ret, wake_irq;
> +
> +	wake_irq = gpiod_to_irq(wake);
> +	if (wake_irq < 0) {
> +		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
> +		return;
> +	}
> +
> +	device_init_wakeup(&pdev->dev, true);

Just set wakeup only if dev_pm_set_dedicated_shared_wake_irq() succeeds.

> +
> +	/*
> +	 * dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with the
> +	 * device and requests it, but the PM core keeps it disabled by default.
> +	 * The IRQ is enabled only when the device is allowed to wake the system
> +	 * (during system suspend and after runtime suspend), and only if device
> +	 * wakeup is enabled.
> +	 *
> +	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
> +	 * to bring the device back to an active power state (e.g. from D3cold to D0).
> +	 * Once the device is active and the link is usable, the endpoint may signal
> +	 * a PME, which is then handled by the PCI core (either via PME polling or the
> +	 * PCIe PME service driver) to wakeup particular endpoint.
> +	 */
> +	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
> +						   IRQ_TYPE_EDGE_FALLING);

Isn't WAKE# a level triggered signal?

> +	if (ret < 0) {
> +		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);

s/wake/WAKE#

- Mani

-- 
மணிவண்ணன் சதாசிவம்

