Return-Path: <linux-gpio+bounces-36764-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGTJFf2TBGqrLgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36764-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:08:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C77535C81
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 003CB303D569
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B578472786;
	Wed, 13 May 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPWzEL5A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A90E402426;
	Wed, 13 May 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684462; cv=none; b=Tw7WF2xewDQQq/t7UctJ6/RrI4YlKOglN2JZuODvrie2BV1fJiO3VMJ1ZB/JoBRDcwIt1tKJiCnxHEudx23yLlV9Y6MW+ZNnAF4/SdWoK4YboJabm2dSLO/Y2rQBTrWQCDaGtNBwLIjARCPqofOggeOrHtHU64KcNBgvvfYBU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684462; c=relaxed/simple;
	bh=Gimz1VkuDyZIY+v+JrO7DO39TujDkTm+HWFtuH+bhFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVL72kG98LGA71rotgzRN2oW8CoohbkOYVy8IqJtP2IMK69z4eIn59QOeUn5h9SR8z67mdQftZMa6pBUJxzubmqlWSawDISPNHQc7efxWYYjVBlXJYXR3pRXLALjgYA21y0lWx8mmW01eIbzCMoMzgnSoO9RubTMcZz6n39LJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPWzEL5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A0C19425;
	Wed, 13 May 2026 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684461;
	bh=Gimz1VkuDyZIY+v+JrO7DO39TujDkTm+HWFtuH+bhFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPWzEL5AkhDAvaSQhPdS1/uTRqrYY5a0f9+oAQd5ntiJyxBlwAu44HkUdXqCBZ1cG
	 WYY3AT8m2tAc1l0Zbd2TrS1oiLeEZKxQjtUpugG4H1TEQ9ke/T8u4yhe/RI14m7fxU
	 MenwH6fSVw/GaZ+E2S4h6IJWB16fo7GV1G+nK0yh7Y2OlNoi/AEPFXqXsGRKHsfB7C
	 b/KkrqQckT1DYVkGBBpJ4dhOcDf7e1cwJUPVwdzxIXLEWWOCIJiVw0icjRP6HlYLsA
	 eHVYxPGM12lGIdRQUlrtIaePsdkFydsGRwC/kbsuobyXIZqgmzmSdXlCcBPlqu3SHg
	 kR3ea2Y6+tS/A==
Date: Wed, 13 May 2026 20:30:51 +0530
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
Subject: Re: [PATCH v10 2/2] PCI: Add support for PCIe WAKE# interrupt
Message-ID: <p7la2n65vkfd4bnvygm533rgglx2og5grltolgizbahptbaf3o@42zkaymebhzz>
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
 <20260511-wakeirq_support-v10-2-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511-wakeirq_support-v10-2-c10af9c9eb8c@oss.qualcomm.com>
X-Rspamd-Queue-Id: F3C77535C81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36764-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 12:55:38PM +0530, Krishna Chaitanya Chundru wrote:
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
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/pci/of.c       | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.c      | 11 ++++++++
>  drivers/pci/pci.h      |  2 ++
>  drivers/pci/probe.c    |  2 ++
>  drivers/pci/remove.c   |  1 +
>  include/linux/of_pci.h |  6 +++++
>  include/linux/pci.h    |  2 ++
>  7 files changed, 96 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 6da569fd3b8f..ed3ad5b9a253 100644
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
> @@ -586,6 +588,76 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
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
> +	/*
> +	 * dev_pm_set_dedicated_wake_irq() associates a wakeup IRQ with the
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
> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
> +	if (ret < 0) {
> +		pci_err(pdev, "Failed to set WAKE# IRQ: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = irq_set_irq_type(wake_irq, IRQ_TYPE_LEVEL_LOW);
> +	if (ret < 0) {
> +		dev_pm_clear_wake_irq(&pdev->dev);
> +		pci_err(pdev, "Failed to set irq_type: %d\n", ret);
> +	}
> +}
> +
> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
> +{
> +	struct device_node *dn = pci_device_to_OF_node(dev);
> +	struct gpio_desc *gpio;
> +
> +	if (!dn)
> +		return;
> +	/*
> +	 * fwnode_gpiod_get() may fail with -EBUSY (e.g. shared WAKE#), but the
> +	 * actual WAKE# trigger from the device would still work and the host
> +	 * controller driver will enable power to the topology.
> +	 *
> +	 * -EPROBE_DEFER cannot be propagated here since pci_device_add() has no
> +	 *  retry mechanism.
> +	 */
> +	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake", GPIOD_IN, NULL);
> +	if (!IS_ERR(gpio)) {
> +		dev->wake = gpio;
> +		pci_configure_wake_irq(dev, gpio);
> +	}
> +}
> +
> +void pci_remove_of_wake_gpio(struct pci_dev *dev)
> +{
> +	struct device_node *dn = pci_device_to_OF_node(dev);
> +
> +	if (!dn)
> +		return;
> +
> +	dev_pm_clear_wake_irq(&dev->dev);
> +	gpiod_put(dev->wake);
> +	dev->wake = NULL;
> +}
>  #endif	/* CONFIG_OF_IRQ */
>  
>  static int pci_parse_request_of_pci_ranges(struct device *dev,
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8f7cfcc00090..5bffed535dc2 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -17,6 +17,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
> +#include <linux/of_pci.h>
>  #include <linux/pci.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> @@ -1123,6 +1124,16 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>  	return acpi_pci_bridge_d3(dev);
>  }
>  
> +void platform_pci_configure_wake(struct pci_dev *dev)
> +{
> +	pci_configure_of_wake_gpio(dev);
> +}
> +
> +void platform_pci_remove_wake(struct pci_dev *dev)
> +{
> +	pci_remove_of_wake_gpio(dev);
> +}
> +
>  /**
>   * pci_update_current_state - Read power state of given device and cache it
>   * @dev: PCI device to handle.
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4a14f88e543a..85539c238743 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -284,6 +284,8 @@ void pci_msix_init(struct pci_dev *dev);
>  bool pci_bridge_d3_possible(struct pci_dev *dev);
>  void pci_bridge_d3_update(struct pci_dev *dev);
>  int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
> +void platform_pci_configure_wake(struct pci_dev *dev);
> +void platform_pci_remove_wake(struct pci_dev *dev);
>  
>  static inline bool pci_bus_rrs_vendor_id(u32 l)
>  {
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index b63cd0c310bc..143b0bd35b3c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2775,6 +2775,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
>  	pci_tsm_init(dev);
>  
> +	platform_pci_configure_wake(dev);
> +
>  	pci_npem_create(dev);
>  
>  	pci_doe_sysfs_init(dev);
> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> index e9d519993853..d781b41e57c4 100644
> --- a/drivers/pci/remove.c
> +++ b/drivers/pci/remove.c
> @@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
>  	if (pci_dev_test_and_set_removed(dev))
>  		return;
>  
> +	platform_pci_remove_wake(dev);
>  	pci_doe_sysfs_teardown(dev);
>  	pci_npem_remove(dev);
>  
> diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
> index 29658c0ee71f..649fe8eafcfa 100644
> --- a/include/linux/of_pci.h
> +++ b/include/linux/of_pci.h
> @@ -30,12 +30,18 @@ static inline void of_pci_check_probe_only(void) { }
>  
>  #if IS_ENABLED(CONFIG_OF_IRQ)
>  int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
> +void pci_configure_of_wake_gpio(struct pci_dev *dev);
> +void pci_remove_of_wake_gpio(struct pci_dev *dev);
>  #else
>  static inline int
>  of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>  {
>  	return 0;
>  }
> +
> +static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
> +
> +static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
>  #endif
>  
>  #endif
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 2c4454583c11..4289b60dcc83 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -588,6 +588,8 @@ struct pci_dev {
>  	/* These methods index pci_reset_fn_methods[] */
>  	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
>  
> +	struct gpio_desc *wake; /* Holds WAKE# gpio */
> +
>  #ifdef CONFIG_PCIE_TPH
>  	u16		tph_cap;	/* TPH capability offset */
>  	u8		tph_mode;	/* TPH mode */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

