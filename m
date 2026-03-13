Return-Path: <linux-gpio+bounces-33374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AbhKDQatGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:07:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A422848DE
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8429309A5E2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A0F38F657;
	Fri, 13 Mar 2026 13:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OA7LFHDK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714519D07A;
	Fri, 13 Mar 2026 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410324; cv=none; b=hX66K36A7OMOYvfoEJJ/6wfVF6phY2Ud29ULK/mVV09MGckxF3EdUMJGlBzKU+EIxhIKwL+a6PZ/NVtBhUtZi15a/Hk1d3kuuxXnzd+AaBNEVH2ndkod0ieG1OzPRnn+mZroemHY0G/OFZGzRRcmnc7/l9lRoJOkJU4l19pbj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410324; c=relaxed/simple;
	bh=KUEDHeJ9+fUEleKsJ3lUZgCsOxLAu5zx6mc1aUT48WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXhQj8j3jlAdfwWfZ8qw94+f0aKBMOqAP7zzPGaCGZ5Vo4ih96XCBG2Gwjvy1xyzxEC1e4+CPLg4yBbVDem4J5Mj2ouAH3XkM1HHIbuJTAM6Zlhp5sugvmcImeO/ON10+4W0bMUmBZeEMDxTZmcbu89vsCEByhDy/kKy49Y5xKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OA7LFHDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BC6C19421;
	Fri, 13 Mar 2026 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410324;
	bh=KUEDHeJ9+fUEleKsJ3lUZgCsOxLAu5zx6mc1aUT48WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OA7LFHDKtNwBgSGz9MvGn1bKxkXSdCpizGZ8VuD6xyevFxLAKcKVLs2+nhTXAXm5b
	 J3DfOM+gBxhn3+PgGGAyj5jRyr+MkUR2JcfpX8CTLCtjzuBd2cB85GVhaBAjD/9rlB
	 DHJiL1fj3I2pRjgmoDXJRibL/7Q96bcDzhLZF6KFyxG0dtE1TpzYjoSE3wE1vJkE3P
	 /TyNAgTsoo4nyeEtfBikq9fPP5I+PLqzAUe9WrEAS1IxBOfDQCECWTadKoq1vP3d3r
	 KaFXNDrVgnzstF6T36MaJsVt7o81ABMtZs1lF70v8ez2n4C7b7sWy17NNNDrA+A3GJ
	 SDSJl7MsFdZAA==
Date: Fri, 13 Mar 2026 19:28:27 +0530
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
Message-ID: <53uy2vdzc25frf5rpwbybaor5n6jesapl2x7xusnn5zfaqnfy7@udq7ln2a42n5>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33374-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 84A422848DE
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

No. Linus never gave this tag for *this* patch.

- Mani

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
> +	if (ret < 0) {
> +		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
> +		device_init_wakeup(&pdev->dev, false);
> +	}
> +}
> +
> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
> +{
> +	struct device_node *dn = pci_device_to_OF_node(dev);
> +	struct pci_dev *upstream;
> +	struct gpio_desc *gpio;
> +
> +	if (!dn)
> +		return;
> +
> +	/*
> +	 * The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
> +	 * property defined either in the device node or in the Slot node. So first check
> +	 * for the property in device node and if not available, check in the Slot node.
> +	 */
> +	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
> +				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
> +	if (IS_ERR(gpio)) {
> +		upstream = pci_upstream_bridge(dev);
> +		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
> +			pci_configure_wake_irq(dev, upstream->wake);
> +	} else {
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
> +	device_init_wakeup(&dev->dev, false);
> +	gpiod_put(dev->wake);
> +	dev->wake = NULL;
> +}
>  #endif	/* CONFIG_OF_IRQ */
>  
>  static int pci_parse_request_of_pci_ranges(struct device *dev,
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8479c2e1f74f1044416281aba11bf071ea89488a..3d858f36ab48a6daec645574ca9027d9d6f071de 100644
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
> @@ -1123,6 +1124,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>  	return acpi_pci_bridge_d3(dev);
>  }
>  
> +void platform_pci_configure_wake(struct pci_dev *dev)
> +{
> +	return pci_configure_of_wake_gpio(dev);
> +}
> +
> +void platform_pci_remove_wake(struct pci_dev *dev)
> +{
> +	return pci_remove_of_wake_gpio(dev);
> +}
>  /**
>   * pci_update_current_state - Read power state of given device and cache it
>   * @dev: PCI device to handle.
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce6698514d92500dfea03cc562cdc2..65ca9551e558d2e3331fab0a968620d6b2a2522a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
>  bool pci_bridge_d3_possible(struct pci_dev *dev);
>  void pci_bridge_d3_update(struct pci_dev *dev);
>  int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
> +void platform_pci_configure_wake(struct pci_dev *dev);
> +void platform_pci_remove_wake(struct pci_dev *dev);
>  
>  static inline bool pci_bus_rrs_vendor_id(u32 l)
>  {
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd794384b7877d453c7989941471c999..372b0d2f4531ea53c0570608306a547101d59e7b 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>  	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
>  	pci_tsm_init(dev);
>  
> +	platform_pci_configure_wake(dev);
> +
>  	pci_npem_create(dev);
>  
>  	pci_doe_sysfs_init(dev);
> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
> index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
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
> index 29658c0ee71ff10122760214d04ee2bab01709fd..0efd6e9cb4d3d3beaafb42ea411303139f1150d5 100644
> --- a/include/linux/of_pci.h
> +++ b/include/linux/of_pci.h
> @@ -30,12 +30,16 @@ static inline void of_pci_check_probe_only(void) { }
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
> +static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
> +static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
>  #endif
>  
>  #endif
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -586,6 +586,8 @@ struct pci_dev {
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
> 

-- 
மணிவண்ணன் சதாசிவம்

