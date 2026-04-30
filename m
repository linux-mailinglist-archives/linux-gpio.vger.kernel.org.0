Return-Path: <linux-gpio+bounces-35943-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C7qI8GE82kY4wEAu9opvQ
	(envelope-from <linux-gpio+bounces-35943-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 18:35:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F24A5C82
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 18:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B16C73007660
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1F74219EA;
	Thu, 30 Apr 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPc9pY3k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12F427A0B;
	Thu, 30 Apr 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777566542; cv=none; b=ObDtbFNWbn0e822Gav+5zrLYx6fafm3+LrJb/CNNk6gZNaUdjgBA2b+RPsbweMqCS78nq2Rg2KufhViUlOe8RnHogbbrczmE2RgzjYkOPyKAIMYhjYtAzMNGYn3z73bpfhSG4ew0wAtBn9XezK/5MZ6cqtCYDX6TP0n/ybqh7Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777566542; c=relaxed/simple;
	bh=jgRsewY+If+JOuVi7cNItrBcsWY9spq5fwhsPIc4p+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JGhEHygUKphI3fPZz41SmJaJKBWjOQpXfkRZtK6DmqPtaV09FEcycbampT66rsz4yOovAR1B7NRlZUggvMNioobkmO1dHbw7OQ1vx7zvK6aaMrSKWrL9O3xNvxg4v39PmfTgODhSFgFC4jdSLeaimWvdOQM/BFapIWDGnyhHlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPc9pY3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44570C2BCB3;
	Thu, 30 Apr 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777566542;
	bh=jgRsewY+If+JOuVi7cNItrBcsWY9spq5fwhsPIc4p+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=FPc9pY3kp2fDHFzOS0e48pvzF9Q9T/gp/JOe4WSq/4TWzy3EODQHif1cP4THuvKa3
	 fXQ0YHRgQFUCgNgueHrsgNomVp2mpRZXa/awH4QgB1+FCsEVKclHa5fvnbDXm4BS1X
	 cBNpLVTojfGK2cdsrInNhnByEsQfjnWpJCuLeNUIwlCl5EchVhauGrdwxY+e/zBzMc
	 OdJQj/t6Bs5xcKX2HeTTd6iqKxUjqU4idqDiqAOrC6U8n1GE3z2dS96euFxiFLBHEU
	 T0z/AWDEOoLdG7qbsPc5sEZiB0MKbz0k7FjvXKdTbwsMO8UK5QyD02u1kjVzD/SjUa
	 Q9CET8ujGq1Mg==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Harald Welte <laforge@gnumonks.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] mfd: ezx-pcap: remove unused driver
Date: Thu, 30 Apr 2026 18:28:05 +0200
Message-Id: <20260430162855.2029285-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C2F24A5C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35943-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnumonks.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email,intel.com:email]

From: Arnd Bergmann <arnd@arndb.de>

Support for the Motorola EZX phones based on Intel PXA processors was
removed in 2022, but this driver remained present in the tree. As far
as I can tell, the support was never quite functional upstream because
the board files did not actually instatiate the SPI device for the PCAP.

There are still also drivers for the various mfd cells: keys, touchscreen,
regulor and rtc, all of which are obviously orphaned as well but can
be removed separately as the Kconfig dependency now prevents them from
being enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604301209.f1YXTsIr-lkp@intel.com/
Cc: Harald Welte <laforge@gnumonks.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mfd/Kconfig          |   7 -
 drivers/mfd/Makefile         |   1 -
 drivers/mfd/ezx-pcap.c       | 491 -----------------------------------
 include/linux/mfd/ezx-pcap.h | 253 ------------------
 4 files changed, 752 deletions(-)
 delete mode 100644 drivers/mfd/ezx-pcap.c
 delete mode 100644 include/linux/mfd/ezx-pcap.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..d08d70d41bce 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1199,13 +1199,6 @@ config MFD_OCELOT
 
 	  If unsure, say N.
 
-config EZX_PCAP
-	bool "Motorola EZXPCAP Support"
-	depends on SPI_MASTER
-	help
-	  This enables the PCAP ASIC present on EZX Phones. This is
-	  needed for MMC, TouchScreen, Sound, USB, etc..
-
 config MFD_CPCAP
 	tristate "Support for Motorola CPCAP"
 	depends on SPI
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..dd4bb7e77c33 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -131,7 +131,6 @@ obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
 obj-$(CONFIG_MFD_OCELOT)	+= ocelot-soc.o
 
-obj-$(CONFIG_EZX_PCAP)		+= ezx-pcap.o
 obj-$(CONFIG_MFD_CPCAP)		+= motorola-cpcap.o
 
 obj-$(CONFIG_MCP)		+= mcp-core.o
diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
deleted file mode 100644
index e8b51f630a60..000000000000
--- a/drivers/mfd/ezx-pcap.c
+++ /dev/null
@@ -1,491 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for Motorola PCAP2 as present in EZX phones
- *
- * Copyright (C) 2006 Harald Welte <laforge@openezx.org>
- * Copyright (C) 2009 Daniel Ribeiro <drwyrm@gmail.com>
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/mfd/ezx-pcap.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio/legacy.h>
-#include <linux/slab.h>
-
-#define PCAP_ADC_MAXQ		8
-struct pcap_adc_request {
-	u8 bank;
-	u8 ch[2];
-	u32 flags;
-	void (*callback)(void *, u16[]);
-	void *data;
-};
-
-struct pcap_chip {
-	struct spi_device *spi;
-
-	/* IO */
-	u32 buf;
-	spinlock_t io_lock;
-
-	/* IRQ */
-	unsigned int irq_base;
-	u32 msr;
-	struct work_struct isr_work;
-	struct work_struct msr_work;
-	struct workqueue_struct *workqueue;
-
-	/* ADC */
-	struct pcap_adc_request *adc_queue[PCAP_ADC_MAXQ];
-	u8 adc_head;
-	u8 adc_tail;
-	spinlock_t adc_lock;
-};
-
-/* IO */
-static int ezx_pcap_putget(struct pcap_chip *pcap, u32 *data)
-{
-	struct spi_transfer t;
-	struct spi_message m;
-	int status;
-
-	memset(&t, 0, sizeof(t));
-	spi_message_init(&m);
-	t.len = sizeof(u32);
-	spi_message_add_tail(&t, &m);
-
-	pcap->buf = *data;
-	t.tx_buf = (u8 *) &pcap->buf;
-	t.rx_buf = (u8 *) &pcap->buf;
-	status = spi_sync(pcap->spi, &m);
-
-	if (status == 0)
-		*data = pcap->buf;
-
-	return status;
-}
-
-int ezx_pcap_write(struct pcap_chip *pcap, u8 reg_num, u32 value)
-{
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&pcap->io_lock, flags);
-	value &= PCAP_REGISTER_VALUE_MASK;
-	value |= PCAP_REGISTER_WRITE_OP_BIT
-		| (reg_num << PCAP_REGISTER_ADDRESS_SHIFT);
-	ret = ezx_pcap_putget(pcap, &value);
-	spin_unlock_irqrestore(&pcap->io_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ezx_pcap_write);
-
-int ezx_pcap_read(struct pcap_chip *pcap, u8 reg_num, u32 *value)
-{
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&pcap->io_lock, flags);
-	*value = PCAP_REGISTER_READ_OP_BIT
-		| (reg_num << PCAP_REGISTER_ADDRESS_SHIFT);
-
-	ret = ezx_pcap_putget(pcap, value);
-	spin_unlock_irqrestore(&pcap->io_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ezx_pcap_read);
-
-int ezx_pcap_set_bits(struct pcap_chip *pcap, u8 reg_num, u32 mask, u32 val)
-{
-	unsigned long flags;
-	int ret;
-	u32 tmp = PCAP_REGISTER_READ_OP_BIT |
-		(reg_num << PCAP_REGISTER_ADDRESS_SHIFT);
-
-	spin_lock_irqsave(&pcap->io_lock, flags);
-	ret = ezx_pcap_putget(pcap, &tmp);
-	if (ret)
-		goto out_unlock;
-
-	tmp &= (PCAP_REGISTER_VALUE_MASK & ~mask);
-	tmp |= (val & mask) | PCAP_REGISTER_WRITE_OP_BIT |
-		(reg_num << PCAP_REGISTER_ADDRESS_SHIFT);
-
-	ret = ezx_pcap_putget(pcap, &tmp);
-out_unlock:
-	spin_unlock_irqrestore(&pcap->io_lock, flags);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ezx_pcap_set_bits);
-
-/* IRQ */
-int irq_to_pcap(struct pcap_chip *pcap, int irq)
-{
-	return irq - pcap->irq_base;
-}
-EXPORT_SYMBOL_GPL(irq_to_pcap);
-
-int pcap_to_irq(struct pcap_chip *pcap, int irq)
-{
-	return pcap->irq_base + irq;
-}
-EXPORT_SYMBOL_GPL(pcap_to_irq);
-
-static void pcap_mask_irq(struct irq_data *d)
-{
-	struct pcap_chip *pcap = irq_data_get_irq_chip_data(d);
-
-	pcap->msr |= 1 << irq_to_pcap(pcap, d->irq);
-	queue_work(pcap->workqueue, &pcap->msr_work);
-}
-
-static void pcap_unmask_irq(struct irq_data *d)
-{
-	struct pcap_chip *pcap = irq_data_get_irq_chip_data(d);
-
-	pcap->msr &= ~(1 << irq_to_pcap(pcap, d->irq));
-	queue_work(pcap->workqueue, &pcap->msr_work);
-}
-
-static struct irq_chip pcap_irq_chip = {
-	.name		= "pcap",
-	.irq_disable	= pcap_mask_irq,
-	.irq_mask	= pcap_mask_irq,
-	.irq_unmask	= pcap_unmask_irq,
-};
-
-static void pcap_msr_work(struct work_struct *work)
-{
-	struct pcap_chip *pcap = container_of(work, struct pcap_chip, msr_work);
-
-	ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
-}
-
-static void pcap_isr_work(struct work_struct *work)
-{
-	struct pcap_chip *pcap = container_of(work, struct pcap_chip, isr_work);
-	struct pcap_platform_data *pdata = dev_get_platdata(&pcap->spi->dev);
-	u32 msr, isr, int_sel, service;
-	int irq;
-
-	do {
-		ezx_pcap_read(pcap, PCAP_REG_MSR, &msr);
-		ezx_pcap_read(pcap, PCAP_REG_ISR, &isr);
-
-		/* We can't service/ack irqs that are assigned to port 2 */
-		if (!(pdata->config & PCAP_SECOND_PORT)) {
-			ezx_pcap_read(pcap, PCAP_REG_INT_SEL, &int_sel);
-			isr &= ~int_sel;
-		}
-
-		ezx_pcap_write(pcap, PCAP_REG_MSR, isr | msr);
-		ezx_pcap_write(pcap, PCAP_REG_ISR, isr);
-
-		service = isr & ~msr;
-		for (irq = pcap->irq_base; service; service >>= 1, irq++) {
-			if (service & 1)
-				generic_handle_irq_safe(irq);
-		}
-		ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
-	} while (gpio_get_value(pdata->gpio));
-}
-
-static void pcap_irq_handler(struct irq_desc *desc)
-{
-	struct pcap_chip *pcap = irq_desc_get_handler_data(desc);
-
-	desc->irq_data.chip->irq_ack(&desc->irq_data);
-	queue_work(pcap->workqueue, &pcap->isr_work);
-}
-
-/* ADC */
-void pcap_set_ts_bits(struct pcap_chip *pcap, u32 bits)
-{
-	unsigned long flags;
-	u32 tmp;
-
-	spin_lock_irqsave(&pcap->adc_lock, flags);
-	ezx_pcap_read(pcap, PCAP_REG_ADC, &tmp);
-	tmp &= ~(PCAP_ADC_TS_M_MASK | PCAP_ADC_TS_REF_LOWPWR);
-	tmp |= bits & (PCAP_ADC_TS_M_MASK | PCAP_ADC_TS_REF_LOWPWR);
-	ezx_pcap_write(pcap, PCAP_REG_ADC, tmp);
-	spin_unlock_irqrestore(&pcap->adc_lock, flags);
-}
-EXPORT_SYMBOL_GPL(pcap_set_ts_bits);
-
-static void pcap_disable_adc(struct pcap_chip *pcap)
-{
-	u32 tmp;
-
-	ezx_pcap_read(pcap, PCAP_REG_ADC, &tmp);
-	tmp &= ~(PCAP_ADC_ADEN|PCAP_ADC_BATT_I_ADC|PCAP_ADC_BATT_I_POLARITY);
-	ezx_pcap_write(pcap, PCAP_REG_ADC, tmp);
-}
-
-static void pcap_adc_trigger(struct pcap_chip *pcap)
-{
-	unsigned long flags;
-	u32 tmp;
-	u8 head;
-
-	spin_lock_irqsave(&pcap->adc_lock, flags);
-	head = pcap->adc_head;
-	if (!pcap->adc_queue[head]) {
-		/* queue is empty, save power */
-		pcap_disable_adc(pcap);
-		spin_unlock_irqrestore(&pcap->adc_lock, flags);
-		return;
-	}
-	/* start conversion on requested bank, save TS_M bits */
-	ezx_pcap_read(pcap, PCAP_REG_ADC, &tmp);
-	tmp &= (PCAP_ADC_TS_M_MASK | PCAP_ADC_TS_REF_LOWPWR);
-	tmp |= pcap->adc_queue[head]->flags | PCAP_ADC_ADEN;
-
-	if (pcap->adc_queue[head]->bank == PCAP_ADC_BANK_1)
-		tmp |= PCAP_ADC_AD_SEL1;
-
-	ezx_pcap_write(pcap, PCAP_REG_ADC, tmp);
-	spin_unlock_irqrestore(&pcap->adc_lock, flags);
-	ezx_pcap_write(pcap, PCAP_REG_ADR, PCAP_ADR_ASC);
-}
-
-static irqreturn_t pcap_adc_irq(int irq, void *_pcap)
-{
-	struct pcap_chip *pcap = _pcap;
-	struct pcap_adc_request *req;
-	u16 res[2];
-	u32 tmp;
-
-	spin_lock(&pcap->adc_lock);
-	req = pcap->adc_queue[pcap->adc_head];
-
-	if (WARN(!req, "adc irq without pending request\n")) {
-		spin_unlock(&pcap->adc_lock);
-		return IRQ_HANDLED;
-	}
-
-	/* read requested channels results */
-	ezx_pcap_read(pcap, PCAP_REG_ADC, &tmp);
-	tmp &= ~(PCAP_ADC_ADA1_MASK | PCAP_ADC_ADA2_MASK);
-	tmp |= (req->ch[0] << PCAP_ADC_ADA1_SHIFT);
-	tmp |= (req->ch[1] << PCAP_ADC_ADA2_SHIFT);
-	ezx_pcap_write(pcap, PCAP_REG_ADC, tmp);
-	ezx_pcap_read(pcap, PCAP_REG_ADR, &tmp);
-	res[0] = (tmp & PCAP_ADR_ADD1_MASK) >> PCAP_ADR_ADD1_SHIFT;
-	res[1] = (tmp & PCAP_ADR_ADD2_MASK) >> PCAP_ADR_ADD2_SHIFT;
-
-	pcap->adc_queue[pcap->adc_head] = NULL;
-	pcap->adc_head = (pcap->adc_head + 1) & (PCAP_ADC_MAXQ - 1);
-	spin_unlock(&pcap->adc_lock);
-
-	/* pass the results and release memory */
-	req->callback(req->data, res);
-	kfree(req);
-
-	/* trigger next conversion (if any) on queue */
-	pcap_adc_trigger(pcap);
-
-	return IRQ_HANDLED;
-}
-
-int pcap_adc_async(struct pcap_chip *pcap, u8 bank, u32 flags, u8 ch[],
-						void *callback, void *data)
-{
-	struct pcap_adc_request *req;
-	unsigned long irq_flags;
-
-	/* This will be freed after we have a result */
-	req = kmalloc_obj(struct pcap_adc_request);
-	if (!req)
-		return -ENOMEM;
-
-	req->bank = bank;
-	req->flags = flags;
-	req->ch[0] = ch[0];
-	req->ch[1] = ch[1];
-	req->callback = callback;
-	req->data = data;
-
-	spin_lock_irqsave(&pcap->adc_lock, irq_flags);
-	if (pcap->adc_queue[pcap->adc_tail]) {
-		spin_unlock_irqrestore(&pcap->adc_lock, irq_flags);
-		kfree(req);
-		return -EBUSY;
-	}
-	pcap->adc_queue[pcap->adc_tail] = req;
-	pcap->adc_tail = (pcap->adc_tail + 1) & (PCAP_ADC_MAXQ - 1);
-	spin_unlock_irqrestore(&pcap->adc_lock, irq_flags);
-
-	/* start conversion */
-	pcap_adc_trigger(pcap);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pcap_adc_async);
-
-/* subdevs */
-static int pcap_remove_subdev(struct device *dev, void *unused)
-{
-	platform_device_unregister(to_platform_device(dev));
-	return 0;
-}
-
-static int pcap_add_subdev(struct pcap_chip *pcap,
-						struct pcap_subdev *subdev)
-{
-	struct platform_device *pdev;
-	int ret;
-
-	pdev = platform_device_alloc(subdev->name, subdev->id);
-	if (!pdev)
-		return -ENOMEM;
-
-	pdev->dev.parent = &pcap->spi->dev;
-	pdev->dev.platform_data = subdev->platform_data;
-
-	ret = platform_device_add(pdev);
-	if (ret)
-		platform_device_put(pdev);
-
-	return ret;
-}
-
-static void ezx_pcap_remove(struct spi_device *spi)
-{
-	struct pcap_chip *pcap = spi_get_drvdata(spi);
-	unsigned long flags;
-	int i;
-
-	/* remove all registered subdevs */
-	device_for_each_child(&spi->dev, NULL, pcap_remove_subdev);
-
-	/* cleanup ADC */
-	spin_lock_irqsave(&pcap->adc_lock, flags);
-	for (i = 0; i < PCAP_ADC_MAXQ; i++)
-		kfree(pcap->adc_queue[i]);
-	spin_unlock_irqrestore(&pcap->adc_lock, flags);
-
-	/* cleanup irqchip */
-	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
-		irq_set_chip_and_handler(i, NULL, NULL);
-}
-
-static int ezx_pcap_probe(struct spi_device *spi)
-{
-	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
-	struct pcap_chip *pcap;
-	int i, adc_irq;
-	int ret;
-
-	/* platform data is required */
-	if (!pdata)
-		return -ENODEV;
-
-	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap)
-		return -ENOMEM;
-
-	spin_lock_init(&pcap->io_lock);
-	spin_lock_init(&pcap->adc_lock);
-	INIT_WORK(&pcap->isr_work, pcap_isr_work);
-	INIT_WORK(&pcap->msr_work, pcap_msr_work);
-	spi_set_drvdata(spi, pcap);
-
-	/* setup spi */
-	spi->bits_per_word = 32;
-	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
-	ret = spi_setup(spi);
-	if (ret)
-		return ret;
-
-	pcap->spi = spi;
-
-	/* setup irq */
-	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
-	if (!pcap->workqueue)
-		return -ENOMEM;
-
-	/* redirect interrupts to AP, except adcdone2 */
-	if (!(pdata->config & PCAP_SECOND_PORT))
-		ezx_pcap_write(pcap, PCAP_REG_INT_SEL,
-					(1 << PCAP_IRQ_ADCDONE2));
-
-	/* setup irq chip */
-	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++) {
-		irq_set_chip_and_handler(i, &pcap_irq_chip, handle_simple_irq);
-		irq_set_chip_data(i, pcap);
-		irq_clear_status_flags(i, IRQ_NOREQUEST | IRQ_NOPROBE);
-	}
-
-	/* mask/ack all PCAP interrupts */
-	ezx_pcap_write(pcap, PCAP_REG_MSR, PCAP_MASK_ALL_INTERRUPT);
-	ezx_pcap_write(pcap, PCAP_REG_ISR, PCAP_CLEAR_INTERRUPT_REGISTER);
-	pcap->msr = PCAP_MASK_ALL_INTERRUPT;
-
-	irq_set_irq_type(spi->irq, IRQ_TYPE_EDGE_RISING);
-	irq_set_chained_handler_and_data(spi->irq, pcap_irq_handler, pcap);
-	irq_set_irq_wake(spi->irq, 1);
-
-	/* ADC */
-	adc_irq = pcap_to_irq(pcap, (pdata->config & PCAP_SECOND_PORT) ?
-					PCAP_IRQ_ADCDONE2 : PCAP_IRQ_ADCDONE);
-
-	ret = devm_request_irq(&spi->dev, adc_irq, pcap_adc_irq, 0, "ADC",
-				pcap);
-	if (ret)
-		goto free_irqchip;
-
-	/* setup subdevs */
-	for (i = 0; i < pdata->num_subdevs; i++) {
-		ret = pcap_add_subdev(pcap, &pdata->subdevs[i]);
-		if (ret)
-			goto remove_subdevs;
-	}
-
-	/* board specific quirks */
-	if (pdata->init)
-		pdata->init(pcap);
-
-	return 0;
-
-remove_subdevs:
-	device_for_each_child(&spi->dev, NULL, pcap_remove_subdev);
-free_irqchip:
-	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
-		irq_set_chip_and_handler(i, NULL, NULL);
-
-	return ret;
-}
-
-static struct spi_driver ezxpcap_driver = {
-	.probe	= ezx_pcap_probe,
-	.remove = ezx_pcap_remove,
-	.driver = {
-		.name	= "ezx-pcap",
-	},
-};
-
-static int __init ezx_pcap_init(void)
-{
-	return spi_register_driver(&ezxpcap_driver);
-}
-
-static void __exit ezx_pcap_exit(void)
-{
-	spi_unregister_driver(&ezxpcap_driver);
-}
-
-subsys_initcall(ezx_pcap_init);
-module_exit(ezx_pcap_exit);
-
-MODULE_AUTHOR("Daniel Ribeiro / Harald Welte");
-MODULE_DESCRIPTION("Motorola PCAP2 ASIC Driver");
-MODULE_ALIAS("spi:ezx-pcap");
diff --git a/include/linux/mfd/ezx-pcap.h b/include/linux/mfd/ezx-pcap.h
deleted file mode 100644
index ea51b1cdca5a..000000000000
--- a/include/linux/mfd/ezx-pcap.h
+++ /dev/null
@@ -1,253 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright 2009 Daniel Ribeiro <drwyrm@gmail.com>
- *
- * For further information, please see http://wiki.openezx.org/PCAP2
- */
-
-#ifndef EZX_PCAP_H
-#define EZX_PCAP_H
-
-struct pcap_subdev {
-	int id;
-	const char *name;
-	void *platform_data;
-};
-
-struct pcap_platform_data {
-	unsigned int irq_base;
-	unsigned int config;
-	int gpio;
-	void (*init) (void *);	/* board specific init */
-	int num_subdevs;
-	struct pcap_subdev *subdevs;
-};
-
-struct pcap_chip;
-
-int ezx_pcap_write(struct pcap_chip *, u8, u32);
-int ezx_pcap_read(struct pcap_chip *, u8, u32 *);
-int ezx_pcap_set_bits(struct pcap_chip *, u8, u32, u32);
-int pcap_to_irq(struct pcap_chip *, int);
-int irq_to_pcap(struct pcap_chip *, int);
-int pcap_adc_async(struct pcap_chip *, u8, u32, u8[], void *, void *);
-void pcap_set_ts_bits(struct pcap_chip *, u32);
-
-#define PCAP_SECOND_PORT	1
-#define PCAP_CS_AH		2
-
-#define PCAP_REGISTER_WRITE_OP_BIT	0x80000000
-#define PCAP_REGISTER_READ_OP_BIT	0x00000000
-
-#define PCAP_REGISTER_VALUE_MASK	0x01ffffff
-#define PCAP_REGISTER_ADDRESS_MASK	0x7c000000
-#define PCAP_REGISTER_ADDRESS_SHIFT	26
-#define PCAP_REGISTER_NUMBER		32
-#define PCAP_CLEAR_INTERRUPT_REGISTER	0x01ffffff
-#define PCAP_MASK_ALL_INTERRUPT		0x01ffffff
-
-/* registers accessible by both pcap ports */
-#define PCAP_REG_ISR		0x0	/* Interrupt Status */
-#define PCAP_REG_MSR		0x1	/* Interrupt Mask */
-#define PCAP_REG_PSTAT		0x2	/* Processor Status */
-#define PCAP_REG_VREG2		0x6	/* Regulator Bank 2 Control */
-#define PCAP_REG_AUXVREG	0x7	/* Auxiliary Regulator Control */
-#define PCAP_REG_BATT		0x8	/* Battery Control */
-#define PCAP_REG_ADC		0x9	/* AD Control */
-#define PCAP_REG_ADR		0xa	/* AD Result */
-#define PCAP_REG_CODEC		0xb	/* Audio Codec Control */
-#define PCAP_REG_RX_AMPS	0xc	/* RX Audio Amplifiers Control */
-#define PCAP_REG_ST_DAC		0xd	/* Stereo DAC Control */
-#define PCAP_REG_BUSCTRL	0x14	/* Connectivity Control */
-#define PCAP_REG_PERIPH		0x15	/* Peripheral Control */
-#define PCAP_REG_LOWPWR		0x18	/* Regulator Low Power Control */
-#define PCAP_REG_TX_AMPS	0x1a	/* TX Audio Amplifiers Control */
-#define PCAP_REG_GP		0x1b	/* General Purpose */
-#define PCAP_REG_TEST1		0x1c
-#define PCAP_REG_TEST2		0x1d
-#define PCAP_REG_VENDOR_TEST1	0x1e
-#define PCAP_REG_VENDOR_TEST2	0x1f
-
-/* registers accessible by pcap port 1 only (a1200, e2 & e6) */
-#define PCAP_REG_INT_SEL	0x3	/* Interrupt Select */
-#define PCAP_REG_SWCTRL		0x4	/* Switching Regulator Control */
-#define PCAP_REG_VREG1		0x5	/* Regulator Bank 1 Control */
-#define PCAP_REG_RTC_TOD	0xe	/* RTC Time of Day */
-#define PCAP_REG_RTC_TODA	0xf	/* RTC Time of Day Alarm */
-#define PCAP_REG_RTC_DAY	0x10	/* RTC Day */
-#define PCAP_REG_RTC_DAYA	0x11	/* RTC Day Alarm */
-#define PCAP_REG_MTRTMR		0x12	/* AD Monitor Timer */
-#define PCAP_REG_PWR		0x13	/* Power Control */
-#define PCAP_REG_AUXVREG_MASK	0x16	/* Auxiliary Regulator Mask */
-#define PCAP_REG_VENDOR_REV	0x17
-#define PCAP_REG_PERIPH_MASK	0x19	/* Peripheral Mask */
-
-/* PCAP2 Interrupts */
-#define PCAP_NIRQS		23
-#define PCAP_IRQ_ADCDONE	0	/* ADC done port 1 */
-#define PCAP_IRQ_TS		1	/* Touch Screen */
-#define PCAP_IRQ_1HZ		2	/* 1HZ timer */
-#define PCAP_IRQ_WH		3	/* ADC above high limit */
-#define PCAP_IRQ_WL		4	/* ADC below low limit */
-#define PCAP_IRQ_TODA		5	/* Time of day alarm */
-#define PCAP_IRQ_USB4V		6	/* USB above 4V */
-#define PCAP_IRQ_ONOFF		7	/* On/Off button */
-#define PCAP_IRQ_ONOFF2		8	/* On/Off button 2 */
-#define PCAP_IRQ_USB1V		9	/* USB above 1V */
-#define PCAP_IRQ_MOBPORT	10
-#define PCAP_IRQ_MIC		11	/* Mic attach/HS button */
-#define PCAP_IRQ_HS		12	/* Headset attach */
-#define PCAP_IRQ_ST		13
-#define PCAP_IRQ_PC		14	/* Power Cut */
-#define PCAP_IRQ_WARM		15
-#define PCAP_IRQ_EOL		16	/* Battery End Of Life */
-#define PCAP_IRQ_CLK		17
-#define PCAP_IRQ_SYSRST		18	/* System Reset */
-#define PCAP_IRQ_DUMMY		19
-#define PCAP_IRQ_ADCDONE2	20	/* ADC done port 2 */
-#define PCAP_IRQ_SOFTRESET	21
-#define PCAP_IRQ_MNEXB		22
-
-/* voltage regulators */
-#define V1		0
-#define V2		1
-#define V3		2
-#define V4		3
-#define V5		4
-#define V6		5
-#define V7		6
-#define V8		7
-#define V9		8
-#define V10		9
-#define VAUX1		10
-#define VAUX2		11
-#define VAUX3		12
-#define VAUX4		13
-#define VSIM		14
-#define VSIM2		15
-#define VVIB		16
-#define SW1		17
-#define SW2		18
-#define SW3		19
-#define SW1S		20
-#define SW2S		21
-
-#define PCAP_BATT_DAC_MASK		0x000000ff
-#define PCAP_BATT_DAC_SHIFT		0
-#define PCAP_BATT_B_FDBK		(1 << 8)
-#define PCAP_BATT_EXT_ISENSE		(1 << 9)
-#define PCAP_BATT_V_COIN_MASK		0x00003c00
-#define PCAP_BATT_V_COIN_SHIFT		10
-#define PCAP_BATT_I_COIN		(1 << 14)
-#define PCAP_BATT_COIN_CH_EN		(1 << 15)
-#define PCAP_BATT_EOL_SEL_MASK		0x000e0000
-#define PCAP_BATT_EOL_SEL_SHIFT		17
-#define PCAP_BATT_EOL_CMP_EN		(1 << 20)
-#define PCAP_BATT_BATT_DET_EN		(1 << 21)
-#define PCAP_BATT_THERMBIAS_CTRL	(1 << 22)
-
-#define PCAP_ADC_ADEN			(1 << 0)
-#define PCAP_ADC_RAND			(1 << 1)
-#define PCAP_ADC_AD_SEL1		(1 << 2)
-#define PCAP_ADC_AD_SEL2		(1 << 3)
-#define PCAP_ADC_ADA1_MASK		0x00000070
-#define PCAP_ADC_ADA1_SHIFT		4
-#define PCAP_ADC_ADA2_MASK		0x00000380
-#define PCAP_ADC_ADA2_SHIFT		7
-#define PCAP_ADC_ATO_MASK		0x00003c00
-#define PCAP_ADC_ATO_SHIFT		10
-#define PCAP_ADC_ATOX			(1 << 14)
-#define PCAP_ADC_MTR1			(1 << 15)
-#define PCAP_ADC_MTR2			(1 << 16)
-#define PCAP_ADC_TS_M_MASK		0x000e0000
-#define PCAP_ADC_TS_M_SHIFT		17
-#define PCAP_ADC_TS_REF_LOWPWR		(1 << 20)
-#define PCAP_ADC_TS_REFENB		(1 << 21)
-#define PCAP_ADC_BATT_I_POLARITY	(1 << 22)
-#define PCAP_ADC_BATT_I_ADC		(1 << 23)
-
-#define PCAP_ADC_BANK_0			0
-#define PCAP_ADC_BANK_1			1
-/* ADC bank 0 */
-#define PCAP_ADC_CH_COIN		0
-#define PCAP_ADC_CH_BATT		1
-#define PCAP_ADC_CH_BPLUS		2
-#define PCAP_ADC_CH_MOBPORTB		3
-#define PCAP_ADC_CH_TEMPERATURE		4
-#define PCAP_ADC_CH_CHARGER_ID		5
-#define PCAP_ADC_CH_AD6			6
-/* ADC bank 1 */
-#define PCAP_ADC_CH_AD7			0
-#define PCAP_ADC_CH_AD8			1
-#define PCAP_ADC_CH_AD9			2
-#define PCAP_ADC_CH_TS_X1		3
-#define PCAP_ADC_CH_TS_X2		4
-#define PCAP_ADC_CH_TS_Y1		5
-#define PCAP_ADC_CH_TS_Y2		6
-
-#define PCAP_ADC_T_NOW			0
-#define PCAP_ADC_T_IN_BURST		1
-#define PCAP_ADC_T_OUT_BURST		2
-
-#define PCAP_ADC_ATO_IN_BURST		6
-#define PCAP_ADC_ATO_OUT_BURST		0
-
-#define PCAP_ADC_TS_M_XY		1
-#define PCAP_ADC_TS_M_PRESSURE		2
-#define PCAP_ADC_TS_M_PLATE_X		3
-#define PCAP_ADC_TS_M_PLATE_Y		4
-#define PCAP_ADC_TS_M_STANDBY		5
-#define PCAP_ADC_TS_M_NONTS		6
-
-#define PCAP_ADR_ADD1_MASK		0x000003ff
-#define PCAP_ADR_ADD1_SHIFT		0
-#define PCAP_ADR_ADD2_MASK		0x000ffc00
-#define PCAP_ADR_ADD2_SHIFT		10
-#define PCAP_ADR_ADINC1			(1 << 20)
-#define PCAP_ADR_ADINC2			(1 << 21)
-#define PCAP_ADR_ASC			(1 << 22)
-#define PCAP_ADR_ONESHOT		(1 << 23)
-
-#define PCAP_BUSCTRL_FSENB		(1 << 0)
-#define PCAP_BUSCTRL_USB_SUSPEND	(1 << 1)
-#define PCAP_BUSCTRL_USB_PU		(1 << 2)
-#define PCAP_BUSCTRL_USB_PD		(1 << 3)
-#define PCAP_BUSCTRL_VUSB_EN		(1 << 4)
-#define PCAP_BUSCTRL_USB_PS		(1 << 5)
-#define PCAP_BUSCTRL_VUSB_MSTR_EN	(1 << 6)
-#define PCAP_BUSCTRL_VBUS_PD_ENB	(1 << 7)
-#define PCAP_BUSCTRL_CURRLIM		(1 << 8)
-#define PCAP_BUSCTRL_RS232ENB		(1 << 9)
-#define PCAP_BUSCTRL_RS232_DIR		(1 << 10)
-#define PCAP_BUSCTRL_SE0_CONN		(1 << 11)
-#define PCAP_BUSCTRL_USB_PDM		(1 << 12)
-#define PCAP_BUSCTRL_BUS_PRI_ADJ	(1 << 24)
-
-/* leds */
-#define PCAP_LED0		0
-#define PCAP_LED1		1
-#define PCAP_BL0		2
-#define PCAP_BL1		3
-#define PCAP_LED_3MA		0
-#define PCAP_LED_4MA		1
-#define PCAP_LED_5MA		2
-#define PCAP_LED_9MA		3
-#define PCAP_LED_T_MASK		0xf
-#define PCAP_LED_C_MASK		0x3
-#define PCAP_BL_MASK		0x1f
-#define PCAP_BL0_SHIFT		0
-#define PCAP_LED0_EN		(1 << 5)
-#define PCAP_LED1_EN		(1 << 6)
-#define PCAP_LED0_T_SHIFT	7
-#define PCAP_LED1_T_SHIFT	11
-#define PCAP_LED0_C_SHIFT	15
-#define PCAP_LED1_C_SHIFT	17
-#define PCAP_BL1_SHIFT		20
-
-/* RTC */
-#define PCAP_RTC_DAY_MASK	0x3fff
-#define PCAP_RTC_TOD_MASK	0xffff
-#define PCAP_RTC_PC_MASK	0x7
-#define SEC_PER_DAY		86400
-
-#endif
-- 
2.39.5


