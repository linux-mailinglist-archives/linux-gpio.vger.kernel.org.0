Return-Path: <linux-gpio+bounces-27048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8810BD58F3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 19:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93AAA4E59D2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 17:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA568304BDD;
	Mon, 13 Oct 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNTYQE1L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841311A23A0;
	Mon, 13 Oct 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760377401; cv=none; b=bkZ3sBQJ+RM/00r7CvmYPd93Z2IQRnNY+Wxo/eCt9D2oTLwdzkZWmOxTa2uXkdEyUAAAvdHXYVFxYsswui1GUqDVYSau9EnWu1OOKE8KPifjAVl41PkwoJDKEveBTbn1vRfDaKT330W19bkoqYEL6LBuO1x9eTV8Zd6Bw16bqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760377401; c=relaxed/simple;
	bh=92eLS7nQDkQePuTk6XG7WUpALuT+NugTK701bsG49lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VA7VtK8hiN8vXUi8wn22EvHxVigQrrBS3dZ+CQw7IUvBCb7f7FJsvieSoqgmlmZMtlo6RAIixIShIIRnToXAd1+FyeHjkLIpE5LxHfzakWmhjjMFObsp199zJvFj21JceLCujLIgMS14psDnYgKTWz6DvhUsiij/t698/qwDiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNTYQE1L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE53C4CEE7;
	Mon, 13 Oct 2025 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377401;
	bh=92eLS7nQDkQePuTk6XG7WUpALuT+NugTK701bsG49lE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LNTYQE1LFfH5+mtWVA6RAfr8ViJR7HLKQYsCaY4Q91+CYJu4hvVPFjra2tuiMaMZg
	 4J5JGeefPyY82AuxEE1jjOZww3WluN5XqL2L2tGtfDd2CTeK47J3TSf+whPMWeA27Y
	 iyCUsKjpOAUUdqGSPz6bGDUDszhV48yPLgrzB9xLuQJ/b9P/hhGorEtbdQ/CX6P/cW
	 rzogJl+IVilQpYwPmBAU+0oQgmDCXVguZojpQ+ylT+fJcRJTa14Gj0CKBYZohvB8YP
	 380ql89m7LWcoqkJeSKsOLzSjlqzPFv5jtT3j6WlYuZMnyNaqmWXZd38fVT4LxwCMt
	 GMV9JCbbwG1Rg==
Date: Mon, 13 Oct 2025 12:43:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Michael Buesch <m@bues.ch>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] gpio: bt8xx: use generic PCI PM
Message-ID: <20251013174319.GA847155@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013155303.1103235-1-vaibhavgupta40@gmail.com>

On Mon, Oct 13, 2025 at 03:52:59PM +0000, Vaibhav Gupta wrote:
> Switch to the new generic PCI power management framework and remove legacy
> callbacks like .suspend() and .resume(). With the generic framework, the
> standard PCI related work like:
> 	- pci_save/restore_state()
> 	- pci_enable/disable_device()
> 	- pci_set_power_state()
> is handled by the PCI core and this driver should implement only gpio-bt8xx
> specific operations in its respective callback functions.

Tiny nits:

s/use generic PCI PM/use generic power management/  # subject; not PCI
s/new generic PCI power/generic power management/   # no longer "new" :)

> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/gpio/gpio-bt8xx.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
> index 05401da03ca3..70b49c385b43 100644
> --- a/drivers/gpio/gpio-bt8xx.c
> +++ b/drivers/gpio/gpio-bt8xx.c
> @@ -52,10 +52,8 @@ struct bt8xxgpio {
>  	struct pci_dev *pdev;
>  	struct gpio_chip gpio;
>  
> -#ifdef CONFIG_PM
>  	u32 saved_outen;
>  	u32 saved_data;
> -#endif
>  };
>  
>  #define bgwrite(dat, adr)	writel((dat), bg->mmio+(adr))
> @@ -224,9 +222,9 @@ static void bt8xxgpio_remove(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>  
> -#ifdef CONFIG_PM
> -static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused bt8xxgpio_suspend(struct device *dev)

I think __maybe_unused is unnecessary because of this path:

  DEFINE_SIMPLE_DEV_PM_OPS
    _DEFINE_DEV_PM_OPS
      SYSTEM_SLEEP_PM_OPS
        pm_sleep_ptr
	  PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))

Detailed explanation here:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/util_macros.h?id=v6.17#n86

>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
>  
>  	scoped_guard(spinlock_irqsave, &bg->lock) {

Unrelated to this patch, but it's not clear to me why bg->lock is
needed here (or maybe anywhere).

  $ git grep -l "static int.*_suspend" drivers/gpio | wc -l
  26
  $ git grep -W "static int.*_suspend" drivers/gpio | grep lock | grep -v unlock | wc -l

It looks like only about 8 of the 26 gpio drivers that implement
.suspend() protect it with a lock.  I would expect a lock to be needed
in all of them or none of them.

> @@ -238,23 +236,13 @@ static int bt8xxgpio_suspend(struct pci_dev *pdev, pm_message_t state)
>  		bgwrite(0x0, BT848_GPIO_OUT_EN);
>  	}
>  
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> -
>  	return 0;
>  }
>  
> -static int bt8xxgpio_resume(struct pci_dev *pdev)
> +static int __maybe_unused bt8xxgpio_resume(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct bt8xxgpio *bg = pci_get_drvdata(pdev);
> -	int err;
> -
> -	pci_set_power_state(pdev, PCI_D0);
> -	err = pci_enable_device(pdev);
> -	if (err)
> -		return err;
> -	pci_restore_state(pdev);
>  
>  	guard(spinlock_irqsave)(&bg->lock);
>  
> @@ -267,10 +255,8 @@ static int bt8xxgpio_resume(struct pci_dev *pdev)
>  
>  	return 0;
>  }
> -#else
> -#define bt8xxgpio_suspend NULL
> -#define bt8xxgpio_resume NULL
> -#endif /* CONFIG_PM */
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(bt8xxgpio_pm_ops, bt8xxgpio_suspend, bt8xxgpio_resume);
>  
>  static const struct pci_device_id bt8xxgpio_pci_tbl[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_BROOKTREE, PCI_DEVICE_ID_BT848) },
> @@ -286,8 +272,7 @@ static struct pci_driver bt8xxgpio_pci_driver = {
>  	.id_table	= bt8xxgpio_pci_tbl,
>  	.probe		= bt8xxgpio_probe,
>  	.remove		= bt8xxgpio_remove,
> -	.suspend	= bt8xxgpio_suspend,
> -	.resume		= bt8xxgpio_resume,
> +	.driver.pm	= &bt8xxgpio_pm_ops,
>  };
>  
>  module_pci_driver(bt8xxgpio_pci_driver);
> -- 
> 2.51.0
> 

