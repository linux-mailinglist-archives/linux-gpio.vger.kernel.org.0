Return-Path: <linux-gpio+bounces-10503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4C9883E8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 14:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47A91C22BB3
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A5418B48F;
	Fri, 27 Sep 2024 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="LLoGWuZ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F90218B47B;
	Fri, 27 Sep 2024 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438937; cv=none; b=iMSQOiNro1bf0JCk/PSdKlIsc9jEP1FxoxbXWaR+6Dna91P2flncjNPZAQd4cMrh0Q1Odt2eW642c3S5hjn3GgKwY4+NgKfvSez0KMakft/wHv/gx2Y2YQY0j2Je2hcbaZCiL1CmlNwT4RanvIoupgOp3vLIB/3oXaY4cR2Nr4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438937; c=relaxed/simple;
	bh=BOMUjrCDX/mpkZeQc3erJcFcMgIa9QWT3fwqZXQngdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcS47DKOVXxUxRuhnTVrX96ygCsmm28aXCt2dosusb6DYvztUklAo5IBBm1U55U0VZxgwv4KTnCcWvkskPkPKwcT8ia/abxNSepLQnSepFBg5qCE1fs3p+3EdqmZnfsPHIvydwUBulD8Nfv6+9tZVFU7TxwEyYZuUgUs4aeIIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=LLoGWuZ5; arc=none smtp.client-ip=67.231.149.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.18.1.2/8.18.1.2) with ESMTP id 48RBHF7r001209;
	Fri, 27 Sep 2024 07:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=outbound; bh=L
	b+Ii06hZr9RVIhQ8vABzCk3MPbxyB0NuH1PWnokkzU=; b=LLoGWuZ5VocOlhEnn
	ESmKeS886WQfC4GwiLYlUujT3QauQPP0HIl49ePoXQV9I7CrhFakzKlh7q2q/UwZ
	Togga3hhd7/K7ve6z7KHGCNY5x2m63dz2IxrXD2+G0mzG6aMrhwszwk6hJMl3Dlt
	SDKMzhm08nU00N6hGlNliu3jvt+DtvzQxWpPvcwcXyPgwnRPYciVp1WDczCfXMG7
	zJwl802NtSBZLrLtZOUdwvrkMf/66aNEOdx2L6bT/V5iTdXwQGpK3hBgCmzjsiMw
	VIoOvYsqo8KcpDqHF1vxEGsrDCqc6mM7MLKWUEIRlBQhtQyNf+NJH5i88Kli3xQV
	x1+Yw==
Date: Fri, 27 Sep 2024 14:36:02 +0300
From: Ian Ray <ian.ray@gehealthcare.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock race
Message-ID: <ZvaYopCACdP-dQIi@852ed68de471>
References: <20240620042915.2173-1-ian.ray@gehealthcare.com>
 <8d8462da853b6c147e3cdb790b2e3ea7d4aaf533.camel@suse.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d8462da853b6c147e3cdb790b2e3ea7d4aaf533.camel@suse.de>
X-Proofpoint-ORIG-GUID: 9kRN0ENJbt6vJLNCYM1e_GTzUXfg90mF
X-Proofpoint-GUID: 9kRN0ENJbt6vJLNCYM1e_GTzUXfg90mF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409270083

On Fri, Sep 27, 2024 at 11:49:04AM +0200, Jean Delvare wrote:
> 
> Hello Ian,
> 
> On Thu, 2024-06-20 at 07:29 +0300, Ian Ray wrote:
> > Ensure that `i2c_lock' is held when setting interrupt latch and mask in
> > pca953x_irq_bus_sync_unlock() in order to avoid races.
> >
> > The other (non-probe) call site pca953x_gpio_set_multiple() ensures the
> > lock is held before calling pca953x_write_regs().
> >
> > The problem occurred when a request raced against irq_bus_sync_unlock()
> > approximately once per thousand reboots on an i.MX8MP based system.
:
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -758,6 +758,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
> >         int level;
> >
> >         if (chip->driver_data & PCA_PCAL) {
> > +               guard(mutex)(&chip->i2c_lock);
> > +
> >                 /* Enable latch on interrupt-enabled inputs */
> >                 pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
> >
> 
> I've been asked to backport this fix to SUSE kernels and I have a
> concern about it.
> 
> You take the i2c_lock mutex inside the (chip->driver_data & PCA_PCAL)
> conditional block, where pca953x_write_regs() is being called, and the
> commit description implies this is indeed the call you wanted to
> protect.
> 
> However, immediately after the conditional block, the common code path
> includes a call to pca953x_read_regs(). Looking at the rest of the
> driver code, I see that the i2c_lock mutex is *also* always held
> (except during device probe) when calling this function. Which isn't
> really surprising as I seem to understand the device uses a banked
> register addressing, and this typically affects both reading from and
> writing to registers.
> 
> So I suspect the i2c_lock mutex needs to be held for this call to
> pca953x_read_regs() as well (unless you are familiar with the register
> map and know for sure that the "direction" register is outside of the
> banked register range).

Hello Jean,

Direction is indeed banked (see, for example, PCA953x_BANK_CONFIG).

It certainly looks plausible that a race between
pca953x_gpio_direction_input or pca953x_gpio_direction_output and 
the register read in pca953x_irq_bus_sync_unlock may occur.

In practice, I think that this is unlikely to ever be observed because
(IMHO) GPIO direction is rarely changed after initialization.
(Disclaimer: this is true for the embedded systems I work with.)

Hope this clarifies things.

Thanks,
Ian


> 
> I'm not familiar with the gpio-pca953x driver at all so I may be
> missing something and maybe everything is actually fine, but I would
> appreciate if someone could take a look and give a second opinion.
> 
> Thanks,
> --
> Jean Delvare
> SUSE L3 Support
> 

