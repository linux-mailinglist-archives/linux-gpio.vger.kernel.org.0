Return-Path: <linux-gpio+bounces-24148-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923FB205E4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 12:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F2918A3317
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 10:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D540D23C506;
	Mon, 11 Aug 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="qkZkF/rT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636923C518
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908948; cv=none; b=TA7qAp3oqq0rcUj7qRWReYzXLeToVtmCFYk11JvUssKizHlv64jRiqQOMsHp1hpWN7zxmX7V645fjP12LzYjfCsRK1mQb5eBYpU1SpMEjtiHbsqyQlmBj0wb4l0DpuckENsebbMRWV0cQQmUZgkTe1DvhGbVT37/376Avfw0VtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908948; c=relaxed/simple;
	bh=6bZPApTnpxX9vFDr3dxKBF4mrOmuubRBQu+xsKLXU/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egs7ITKhyLdOOJJd3wKhIHPS8Z/2gGEoirDpK3wRt98ORezx2BDj4hPHkIb0kjwufUPQwL6Kh4e067JOm6E5xwoH2gXvy2hIVXBvsUUx8X5SwPvPuUeyPe2aqqkNzH8649XvAs3fqu6tpW8DK311KxYaLCMsFiK0dERmyso4hH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=qkZkF/rT; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 22A291006D4B
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 16:12:18 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 22A291006D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1754908938; bh=6bZPApTnpxX9vFDr3dxKBF4mrOmuubRBQu+xsKLXU/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkZkF/rThELWDSxHcJlE9lKLEPpsgyBHkz2rijTIa/czQ1Z9q8ioCLNeIFky1C7RJ
	 aREHSBix45i4z5z4gPxxNSxaFJMoBrSenn/slkyN7q81E/LIZz1RfqJw2/42Pw/2Aj
	 XZaYN0LBQ6fICCd16UYC3ZIWstnZevhZjv1e019w=
Received: (qmail 4256 invoked by uid 510); 11 Aug 2025 16:12:18 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.52853 secs; 11 Aug 2025 16:12:18 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 11 Aug 2025 16:12:13 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 263903414ED;
	Mon, 11 Aug 2025 16:12:13 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 0405E1E81336;
	Mon, 11 Aug 2025 16:12:13 +0530 (IST)
Date: Mon, 11 Aug 2025 16:12:08 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linus.walleij@linaro.org, dianders@chromium.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] gpio: virtuser: remove debugfs_create_dir() error checks
Message-ID: <aJnJADCjzP5h0ZMf@bhairav-test.ee.iitb.ac.in>
References: <aJd2Zho5QRUTAEzm@bhairav-test.ee.iitb.ac.in>
 <CAMRc=MczvR7w28Zw6Yn51W7wrkSHjitE3pimHBMgbL_zS8wYhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MczvR7w28Zw6Yn51W7wrkSHjitE3pimHBMgbL_zS8wYhQ@mail.gmail.com>

On Mon, Aug 11, 2025 at 09:47:13AM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 9, 2025 at 6:25 PM Akhilesh Patil <akhilesh@ee.iitb.ac.in> wrote:
> >
> > Remove return value checks for debugfs_create_dir() wherever
> > appropriate. Follow guidelines mentioned in [1] that callers
> > should ignore errors returned as other debugfs functions handle them
> > appropriately.
> > Refer commit 8bcbde2bb1374 ("debugfs: Document that debugfs_create
> > functions need not be error checked") to clean up unnecessary error checks
> > without impacting the functionality.
> >
> > Fixes: 91581c4b3f29e ("gpio: virtuser: new virtual testing driver for the GPIO API")
> > Link: https://lore.kernel.org/all/20220222154555.1.I26d364db7a007f8995e8f0dac978673bc8e9f5e2@changeid/ [1]
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> 
> The commit you linked says: "In many cases (...)". This is not one of
> these cases as this driver is completely useless without functional
> debugfs entries so it very much makes sense to check the relevant
> calls.

Agree. gpio_virtuser_dbgfs_init_line_array_attrs() should return error
upon failure to create debugfs interface.
However with my interpretation of commit 8bcbde2bb1374, in this case we
can still skip error checks for  debugfs_create_dir() at [1] as any error
returned by it will be handled in gpio_virtuser_create_debugfs_attrs() at [2]. 
debugfs_create_file() at [3] can accept error dentry and do not crash.
So IMO, effectively we stil return error upon failure to create debugfs
dir and files while following guidelines mentioned in the commit we
are reffering. I have intentionally not removed [2] and removed [1] with
this thought. 
	Thank you for your time reviewing it :) 

	data->ad.dbgfs_dir = debugfs_create_dir(name, dbgfs_entry);
[1] -->	if (IS_ERR(data->ad.dbgfs_dir))
		return PTR_ERR(data->ad.dbgfs_dir);

	return gpio_virtuser_create_debugfs_attrs(
			gpio_virtuser_line_array_dbgfs_attrs,
			ARRAY_SIZE(gpio_virtuser_line_array_dbgfs_attrs),
			data->ad.dbgfs_dir, data);




static int gpio_virtuser_create_debugfs_attrs(
			const struct gpio_virtuser_dbgfs_attr_descr *attr,
			size_t num_attrs, struct dentry *parent, void *data)
{
	struct dentry *ret;
	size_t i;

	for (i = 0; i < num_attrs; i++, attr++) {
[3] -->		ret = debugfs_create_file(attr->name, 0644, parent, data,
					  attr->fops);
[2] -->		if (IS_ERR(ret))
			return PTR_ERR(ret);
	}

	return 0;
}


> 
> Bart

Regards,
Akhilesh

