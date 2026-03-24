Return-Path: <linux-gpio+bounces-34071-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEwCAoz8wWlSYgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34071-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 03:53:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2E301560
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 03:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B24A4303DD27
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2026 02:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE58388E4D;
	Tue, 24 Mar 2026 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcQlAJN9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E581B4224;
	Tue, 24 Mar 2026 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320775; cv=none; b=afuSXNbz3YxrKjKfdbowcOotoliDXgzM346S0lZ1fywnCF2kz3gUYhuKd7htWMNP0v6YRWj/gKrGmZLkF9UcPW3ET1V0J2GLEfMdCJSRa8QeeglNN/VTVo4qhxe8K3UoSN6Y2oOx7qHsgqVY2LOL0g5iU2L5DFzDalGWZwvu++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320775; c=relaxed/simple;
	bh=Q5GvIR/kAznO3HpTjHMJuWcsgcsox18R1lHxF8wXwBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4zuB6wlXtgqxhoAW6AhGjR/gZJnU0GrefZpAXthL+dx+lEu2vlRqv6ZHzH3OIS/g2m5PO0xXw7xKM/RagZIOUjXVI3zyvcdTNfWqWc1gepPIVSG/5hAJV1ZUrPGrVzWiUbhAnpSXI5L2DesWlK+lSRrhXvMaIQT6d2HE/mwQS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcQlAJN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A70FC2BCB0;
	Tue, 24 Mar 2026 02:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774320775;
	bh=Q5GvIR/kAznO3HpTjHMJuWcsgcsox18R1lHxF8wXwBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcQlAJN9jrtxWiWf2KZXlKFk2RYVmjozS+/2o3hTjTPN1ucmK+KbHx82UrV1gkLKH
	 xp5BhXFKDaoLGP2JDKZEu1Zk1p5DAQqF9wjwDwtwrishXVMAnbEnZpiY2fO8wtVdNc
	 lGt77JmaY5D4hQG1+NQ69bGn5TZ0roFQqPpSFUUtoyW6UhO3gx/ByBdEU4sIJ/73NW
	 jhBJDrtgKtdmbBJOmEAvIsvRcTJtsTmvwlyliGZ/B2E4OU45HvYpTH5OGzqJs3AfIc
	 nCQ0i2V1DY+TIqh5WR/UxVUcrR5AIV+aQAC5PtK+ppvDtGGnvXKlNeqkJw06alJ0e5
	 x/7FRv4lMdoFg==
Date: Mon, 23 Mar 2026 21:52:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] irqchip/qcom-pdc: Configure PDC to pass through mode
Message-ID: <acH7AJq6tcmemvU5@baldur>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-3-760c8593ce50@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34071-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5AE2E301560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:37PM +0530, Maulik Shah wrote:
> There are two modes PDC irqchip supports pass through mode and secondary
> controller mode.
> 
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK.
> 
> There is no way to read which current mode it is set to and make PDC work
> in respective mode as the read access is not opened up for non secure
> world. There is though write access opened up via SCM write API to set the
> mode.
> 
> Configure PDC mode to pass through mode for all x1e based boards via SCM
> write.
> 

You're failing to mention that the SCM interface was not present in
initially shipping Windows firmware, which would result in you breaking
those devices.

If you're certain that this change is available to all users, you can
argue that this is acceptable - but omitting this from the commit
message isn't.

Regards,
Bjorn

> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/irqchip/Kconfig    |   1 +
>  drivers/irqchip/qcom-pdc.c | 119 +++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 111 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 83d333f8bf63d78827800e0de724f81e6aa2f1df..89caddf6e5c569a0e867cda1838c870b967fb13d 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -505,6 +505,7 @@ config GOLDFISH_PIC
>  config QCOM_PDC
>  	tristate "QCOM PDC"
>  	depends on ARCH_QCOM
> +	depends on QCOM_AOSS_QMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
>  	  Power Domain Controller driver to manage and configure wakeup
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 32b77fa93f730416edf120710bcdcdce33fa39a7..051700d672471c092e8cda4d7f5aa6d2032157f7 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -19,6 +19,8 @@
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/soc/qcom/qcom_aoss.h>
>  
>  #define PDC_MAX_GPIO_IRQS	256
>  #define PDC_DRV_OFFSET		0x10000
> @@ -26,9 +28,11 @@
>  /* Valid only on HW version < 3.2 */
>  #define IRQ_ENABLE_BANK		0x10
>  #define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
> +#define IRQ_i_CFG_IRQ_MASK_3_0	3
>  #define IRQ_i_CFG		0x110
>  
>  /* Valid only on HW version >= 3.2 */
> +#define IRQ_i_CFG_IRQ_MASK_3_2	4
>  #define IRQ_i_CFG_IRQ_ENABLE	3
>  
>  #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
> @@ -36,8 +40,11 @@
>  #define PDC_VERSION_REG		0x1000
>  
>  /* Notable PDC versions */
> +#define PDC_VERSION_3_0		0x30000
>  #define PDC_VERSION_3_2		0x30200
>  
> +#define PDC_PASS_THROUGH_MODE	0
> +
>  struct pdc_pin_region {
>  	u32 pin_base;
>  	u32 parent_base;
> @@ -97,6 +104,33 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
>  	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
>  }
>  
> +/*
> + * The new mask bit controls whether the interrupt is to be forwarded to the
> + * parent GIC in secondary controller mode. Writing the mask is do not care
> + * when the PDC is set to pass through mode.
> + *
> + * As linux only makes so far make use of pass through mode set all IRQs
> + * masked during probe.
> + */
> +static void __pdc_mask_intr(int pin_out, bool mask)
> +{
> +	unsigned long irq_cfg;
> +	int mask_bit;
> +
> +	/* Mask bit available from v3.0 */
> +	if (pdc_version < PDC_VERSION_3_0)
> +		return;
> +
> +	if (pdc_version < PDC_VERSION_3_2)
> +		mask_bit = IRQ_i_CFG_IRQ_MASK_3_0;
> +	else
> +		mask_bit = IRQ_i_CFG_IRQ_MASK_3_2;
> +
> +	irq_cfg = pdc_reg_read(IRQ_i_CFG, pin_out);
> +	__assign_bit(mask_bit, &irq_cfg, mask);
> +	pdc_reg_write(IRQ_i_CFG, pin_out, irq_cfg);
> +}
> +
>  static void __pdc_enable_intr(int pin_out, bool on)
>  {
>  	unsigned long enable;
> @@ -312,7 +346,6 @@ static const struct irq_domain_ops qcom_pdc_ops = {
>  static int pdc_setup_pin_mapping(struct device_node *np)
>  {
>  	int ret, n, i;
> -
>  	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
>  	if (n <= 0 || n % 3)
>  		return -EINVAL;
> @@ -341,8 +374,10 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>  		if (ret)
>  			return ret;
>  
> -		for (i = 0; i < pdc_region[n].cnt; i++)
> +		for (i = 0; i < pdc_region[n].cnt; i++) {
>  			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
> +			__pdc_mask_intr(i + pdc_region[n].pin_base, true);
> +		}
>  	}
>  
>  	return 0;
> @@ -352,10 +387,13 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>  
>  static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *parent)
>  {
> +	static const char buf[64] = "{class: cx_mol, res: cx, val: mol}";
> +	unsigned int domain_flag = IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP;
>  	struct irq_domain *parent_domain, *pdc_domain;
>  	struct device_node *node = pdev->dev.of_node;
>  	resource_size_t res_size;
>  	struct resource res;
> +	struct qmp *pdc_qmp;
>  	int ret;
>  
>  	/* compat with old sm8150 DT which had very small region for PDC */
> @@ -366,6 +404,13 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  	if (res_size > resource_size(&res))
>  		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
>  
> +	pdc_base = ioremap(res.start, res_size);
> +	if (!pdc_base) {
> +		pr_err("%pOF: unable to map PDC registers\n", node);
> +		ret = -ENXIO;
> +		goto fail;
> +	}
> +
>  	/*
>  	 * PDC has multiple DRV regions, each one provides the same set of
>  	 * registers for a particular client in the system. Due to a hardware
> @@ -382,15 +427,71 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		}
>  
>  		pdc_x1e_quirk = true;
> -	}
>  
> -	pdc_base = ioremap(res.start, res_size);
> -	if (!pdc_base) {
> -		pr_err("%pOF: unable to map PDC registers\n", node);
> -		ret = -ENXIO;
> -		goto fail;
> +		/*
> +		 * There are two modes PDC irqchip can work in
> +		 *	- pass through mode
> +		 *	- secondary controller mode
> +		 *
> +		 * All PDC irqchip supports pass through mode in which both
> +		 * Direct SPIs and GPIO IRQs (as SPIs) are sent to GIC
> +		 * without latching at PDC.
> +		 *
> +		 * Newer PDCs (v3.0 onwards) also support additional
> +		 * secondary controller mode where PDC latches GPIO IRQs
> +		 * and sends to GIC as level type IRQ. Direct SPIs still
> +		 * works same as pass through mode without latching at PDC
> +		 * even in secondary controller mode.
> +		 *
> +		 * All the SoCs so far default uses pass through mode with
> +		 * the exception of x1e.
> +		 *
> +		 * x1e modes:
> +		 *
> +		 * x1e PDC may be set to secondary controller mode for
> +		 * builds on CRD boards whereas it may be set to pass
> +		 * through mode for IoT-EVK boards.
> +		 *
> +		 * There is no way to read which current mode it is set to
> +		 * and make PDC work in respective mode as the read access
> +		 * is not opened up for non secure world. There is though
> +		 * write access opened up via SCM write API to set the mode.
> +		 *
> +		 * Configure PDC mode to pass through mode for all x1e based
> +		 * boards.
> +		 *
> +		 * For successful write:
> +		 *	- Nothing more to be done
> +		 *
> +		 * For unsuccessful write:
> +		 *	- Inform TLMM to monitor GPIO IRQs (same as MPM)
> +		 *	- Prevent SoC low power mode (CxPC) as PDC is not
> +		 *	  monitoring GPIO IRQs which may be needed to wake
> +		 *	  the SoC from low power mode.
> +		 */
> +		ret = of_address_to_resource(node, 2, &res);
> +		if (ret) {
> +			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
> +			goto skip_scm_write;
> +		}
> +
> +		ret = qcom_scm_io_writel(res.start, PDC_PASS_THROUGH_MODE);
> +		if (ret) {
> +			pdc_qmp = qmp_get(&pdev->dev);
> +			if (IS_ERR(pdc_qmp)) {
> +				ret = PTR_ERR(pdc_qmp);
> +				goto fail;
> +			} else {
> +				ret = qmp_send(pdc_qmp, buf, sizeof(buf));
> +				qmp_put(pdc_qmp);
> +				if (ret)
> +					goto fail;
> +			}
> +			domain_flag = IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP;
> +		}
>  	}
>  
> +skip_scm_write:
>  	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
>  
>  	parent_domain = irq_find_host(parent);
> @@ -407,7 +508,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  	}
>  
>  	pdc_domain = irq_domain_create_hierarchy(parent_domain,
> -					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
> +					domain_flag,
>  					PDC_MAX_GPIO_IRQS,
>  					of_fwnode_handle(node),
>  					&qcom_pdc_ops, NULL);
> 
> -- 
> 2.34.1
> 

