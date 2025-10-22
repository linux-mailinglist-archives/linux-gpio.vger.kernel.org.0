Return-Path: <linux-gpio+bounces-27494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC1BFE095
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 21:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 315C54F1C89
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571D345CD7;
	Wed, 22 Oct 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNuFRWDq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382D2D0C60;
	Wed, 22 Oct 2025 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761161343; cv=none; b=MNwzyoMcTh0/84zy+UmCrA4V8zwU+WxhNw7otf6SOOSPjQHsO6q661qRLbqjIHuWXUjZyR6SHyraLXKvHUAGCUP/omskjMN/xr6tx+wY2rXEqPtnIhjBVANPSyHFjXzx0093eVvYZRE7XiyuATvoQ4MRhv0oB41F1j5P+K0g3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761161343; c=relaxed/simple;
	bh=Lk87Tl3X+1V3xXjGvglO78i8JsEe3q1T37XhvhQwFrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iNpjkrzfnBtGstcTu8x/atTfA2w17Dba12YMt6GZH55G2Vdtdk3gtPCGaXu7YOWuvFbEWsYSe/5dfLssL0c90X1UO8wnH0bkVMaUBm4PttAeAu5l87h/Dy50OTRHzS2fQt7qWQRK/st1ZViSnimw9QaRli8Q+vjZuU1HFtBnjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNuFRWDq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A00CC4CEE7;
	Wed, 22 Oct 2025 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761161342;
	bh=Lk87Tl3X+1V3xXjGvglO78i8JsEe3q1T37XhvhQwFrI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mNuFRWDqYGFT/cpFs1DIsVNPKhFNcJiBkDXEJtrysruR0V/m5KWCkUqMqVnxPn571
	 10J2tP6bN3swzFO4U8UY/pbrFHU1iiRy6M4KxitVhesK+v3n1WOV890p/HtzLrufSf
	 xO6FE/sBfILOcch4l8PmsTQsEVwljD64q7PGh4gBQDs/BmNw38F6E8KcxvbvewCnuo
	 0/hHSpI7a37skqF6+Qlwe+kqvXDZeshzUK/qxNVT3+pnFiShEo0qjUiQYIjt/ngoT/
	 0cBT7ctM+bvfvSXf20tJtG7r7e1srLr9aCNiAfexG49OGDZ2fqJ6bmEAaabU1RIBng
	 +A1nfPE+ABD8A==
Date: Wed, 22 Oct 2025 14:29:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Michael Buesch <m@bues.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] gpio: bt8xx: use generic power management
Message-ID: <20251022192901.GA1265216@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf4FnBoZfdR3gG47te=X53jASzb6MVnUmNw2q1rtUwxzQ@mail.gmail.com>

On Tue, Oct 21, 2025 at 10:48:48AM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 16, 2025 at 6:36 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Switch to the generic PCI power management framework and remove legacy
> > callbacks like .suspend() and .resume(). With the generic framework, the
> > standard PCI related work like:
> >         - pci_save/restore_state()
> >         - pci_enable/disable_device()
> >         - pci_set_power_state()
> > is handled by the PCI core and this driver should implement only gpio-bt8xx
> > specific operations in its respective callback functions.
> >
> > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > ---
> 
> This says it's a v6 but I have no idea what changed since v1. Please
> provide a changelog for every version when submitting patches.
> 
> Bjorn: does this look good to you?

Yes, it looks good to me.

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

FWIW, here's the diff from v1 to v6.  Mostly just iterating on
compile warning nits:

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index e8d0c67bb618..324eeb77dbd5 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -52,10 +52,8 @@ struct bt8xxgpio {
 	struct pci_dev *pdev;
 	struct gpio_chip gpio;
 
-#ifdef CONFIG_PM
 	u32 saved_outen;
 	u32 saved_data;
-#endif
 };
 
 #define bgwrite(dat, adr)	writel((dat), bg->mmio+(adr))
@@ -224,7 +222,8 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 }
 
-static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
+
+static int bt8xxgpio_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
@@ -241,7 +240,7 @@ static int __maybe_unused bt8xxgpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused bt8xxgpio_resume(struct device *dev)
+static int bt8xxgpio_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
@@ -258,7 +257,7 @@ static int __maybe_unused bt8xxgpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
 
 static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },

