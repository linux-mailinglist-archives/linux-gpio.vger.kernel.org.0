Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F54720683C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 01:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387659AbgFWXXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 19:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387495AbgFWXXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 19:23:19 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C88C061573;
        Tue, 23 Jun 2020 16:23:19 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 136so169663pfv.3;
        Tue, 23 Jun 2020 16:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6t/1Z/lSRgPZ8Hvkcqs3St2ScCj2y+03B5TqhrsC79g=;
        b=DDTMTj5oJp1G+hclihl62aCxbsiZXSHc0Qj5+g7nHGg1iWlXaTsaY55vbY1W2xBJmK
         WT1QNr7HpsyKMM0vL1m3Y9G6Zjlq+s9+0vUsZxXUTwV53Ehqj83Hd61OoKm/UiPRpzHw
         L4VpuUbRdtZiDGCTP5SpvjNvO8G6Zo5wv8zbHJ321zzlb8CMluhOoeWtju6sLC31YfM1
         7uUJDF2h25H79BkpSPUBgplEMKUPZH8ySuMnxM6Kwa3bBPDUB/Q704c3DCLn3vcHDwk1
         GpEIyNZCcpJ/hWrH/TEsxHTyH6skF9Em7AwIMrq5spxvWxn0LtYdOG4SA7Wzf6wipjPM
         g5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6t/1Z/lSRgPZ8Hvkcqs3St2ScCj2y+03B5TqhrsC79g=;
        b=HCD/b6U3fCy0TEk6FilqkVNHivCsdebfPrtm9M05cVf03nWdn7BEX7RtrrNmHyGVYz
         0nrXu7wf/mnXaUDsWesv/FEKzDNBeMA8U9XBXPQkLDrcccxuNuQuATwtkalCi0h26HhA
         PzapJvRESz3E/ZgIoz0DcC0S5KkibtkdbYSP8xvbewDSRdp7dBIrfJ1X2+4lV2eF7pbz
         CYI3r5MAZOiU3uOdxpAxsU6JMl5XJxJbW7rQH+cThCNFMe8PVCJFovEixpp70QhNBK68
         pdggOeKVvaU6s2rTt8CrCfsL6RMgbfZp/GiH+ANKqQYgLCdrmDrUMNXL9MURsLewY8Ev
         rdbg==
X-Gm-Message-State: AOAM531cebICwFo+BkzisxDYBz/dtCD46e8CC6Xv6YZRpT2YLP4tlMb3
        9AqDGHlvvCQhGzMNYu33Ulw=
X-Google-Smtp-Source: ABdhPJy21y8QFSvyuqucm8myTb67+tRovUPxKuQbmrK4GuNt8p+fMnq0h/mO/SJuJ9MB1WbbdnIhWA==
X-Received: by 2002:aa7:8f1c:: with SMTP id x28mr9777416pfr.19.1592954599040;
        Tue, 23 Jun 2020 16:23:19 -0700 (PDT)
Received: from sol (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id g9sm17895376pfm.151.2020.06.23.16.23.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 16:23:17 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:23:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, lkp@intel.com, kbuild-all@lists.01.org
Subject: Re: [PATCH 16/22] gpiolib: cdev: add V2 uAPI implementation to
 parity with V1
Message-ID: <20200623232310.GA8901@sol>
References: <20200623040107.22270-17-warthog618@gmail.com>
 <20200623174438.GL4151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623174438.GL4151@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 08:44:38PM +0300, Dan Carpenter wrote:
> [ The copy_to_user() overflow code is weird.  Why do we need to do a
>   atomic_read()?  That suggests that there is a potential time of check
>   time of use bug where we do:
> 

It is weird, but you conveniently left out the guard comment:

		/* must be after kfifo check so watch_abi_version is set */

> 	if (atomic_read(&gcdev->watch_abi_version) == 2) // <<-- time of check
> 		event_size = sizeof(struct gpioline_info_changed_v2);
> 

For something to be in the fifo lineinfo_ensure_abi_version must've been
called. And the watch_abi_version can only be set once by
lineinfo_ensure_abi_version, so it cannot change between.

But point taken, I'll change the "time of use" condition to 

		if (event_size == sizeof(struct gpioline_info_changed_v2)) {
			if (copy_to_user(buf + bytes_read, &event, event_size))

> 	...
> 
> 	if (atomic_read(&gcdev->watch_abi_version) == 2) { // <<-- time of use
> 		copy_to_user(blah, blah, event_size);
> 
>   If the value for "gcdev->watch_abi_version" changes between the time
>   of check and the time of use then it can read beyond the end of the
>   buffer.
> 
>   -- dan ]
> 
> Hi Kent,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> url:    https://github.com/0day-ci/linux/commits/Kent-Gibson/gpio-cdev-add-uAPI-V2/20200623-120634
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: openrisc-randconfig-m031-20200623 (attached as .config)
> compiler: or1k-linux-gcc (GCC) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/gpio/gpiolib-cdev.c:891 line_free() error: dereferencing freed memory 'line'
> drivers/gpio/gpiolib-cdev.c:949 line_create() warn: possible memory leak of 'line'
> drivers/gpio/gpiolib-cdev.c:1860 lineinfo_watch_read() error: copy_to_user() '&event_v1' too small (104 vs 168)
> 
> # https://github.com/0day-ci/linux/commit/f3b3ae8752adc5ac33dcf83d49b0b02f2d7ef43b
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout f3b3ae8752adc5ac33dcf83d49b0b02f2d7ef43b
> vim +/line +891 drivers/gpio/gpiolib-cdev.c
> 
> f3b3ae8752adc5 Kent Gibson 2020-06-23   877  static void line_free(struct line *line)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   878  {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   879  	int i;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   880  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   881  	for (i = 0; i < line->num_descs; i++) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   882  		if (line->edets)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   883  			edge_detector_stop(&line->edets[i]);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   884  		if (line->descs[i])
> f3b3ae8752adc5 Kent Gibson 2020-06-23   885  			gpiod_free(line->descs[i]);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   886  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23   887  	kfifo_free(&line->events);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   888  	kfree(line->label);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   889  	kfree(line->edets);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   890  	kfree(line);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  @891  	put_device(&line->gdev->dev);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   892  }
> f3b3ae8752adc5 Kent Gibson 2020-06-23   893  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   894  static int line_release(struct inode *inode, struct file *file)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   895  {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   896  	struct line *line = file->private_data;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   897  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   898  	line_free(line);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   899  	return 0;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   900  }
> f3b3ae8752adc5 Kent Gibson 2020-06-23   901  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   902  static const struct file_operations line_fileops = {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   903  	.release = line_release,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   904  	.read = line_read,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   905  	.poll = line_poll,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   906  	.owner = THIS_MODULE,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   907  	.llseek = noop_llseek,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   908  	.unlocked_ioctl = line_ioctl,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   909  #ifdef CONFIG_COMPAT
> f3b3ae8752adc5 Kent Gibson 2020-06-23   910  	.compat_ioctl = line_ioctl_compat,
> f3b3ae8752adc5 Kent Gibson 2020-06-23   911  #endif
> f3b3ae8752adc5 Kent Gibson 2020-06-23   912  };
> f3b3ae8752adc5 Kent Gibson 2020-06-23   913  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   914  static int line_create(struct gpio_device *gdev, void __user *ip)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   915  {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   916  	struct gpioline_request linereq;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   917  	struct line *line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   918  	struct file *file;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   919  	int fd, i, ret, size;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   920  	struct gpioline_config *lc;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   921  	unsigned long *vals;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   922  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   923  	if (copy_from_user(&linereq, ip, sizeof(linereq)))
> f3b3ae8752adc5 Kent Gibson 2020-06-23   924  		return -EFAULT;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   925  	if ((linereq.num_lines == 0) || (linereq.num_lines > GPIOLINES_MAX))
> f3b3ae8752adc5 Kent Gibson 2020-06-23   926  		return -EINVAL;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   927  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   928  	if (padding_not_zeroed(linereq.padding, GPIOLINE_REQUEST_PAD_SIZE))
> f3b3ae8752adc5 Kent Gibson 2020-06-23   929  		return -EINVAL;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   930  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   931  	lc = &linereq.config;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   932  	ret = gpioline_config_validate(lc);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   933  	if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   934  		return ret;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   935  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   936  	/* event_buffer_size only valid with edge_detection */
> f3b3ae8752adc5 Kent Gibson 2020-06-23   937  	if ((linereq.event_buffer_size) &&
> f3b3ae8752adc5 Kent Gibson 2020-06-23   938  	    !(linereq.config.flags & GPIOLINE_FLAG_V2_EDGE_DETECTION))
> f3b3ae8752adc5 Kent Gibson 2020-06-23   939  		return -EINVAL;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   940  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   941  	line = kzalloc(struct_size(line, descs, linereq.num_lines),
> f3b3ae8752adc5 Kent Gibson 2020-06-23   942  		       GFP_KERNEL);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   943  	if (!line)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   944  		return -ENOMEM;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   945  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   946  	line->edets = kcalloc(linereq.num_lines, sizeof(*line->edets),
> f3b3ae8752adc5 Kent Gibson 2020-06-23   947  			      GFP_KERNEL);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   948  	if (!line->edets)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  @949  		return -ENOMEM;
>                                                         ^^^^^^^^^^^^^^^
> kfree(line) before returning.
> 

Yeah, that is bad.  Good pickup - it should be a goto out_free_line like
the one below for line->label.

Cheers,
Kent.

> f3b3ae8752adc5 Kent Gibson 2020-06-23   950  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   951  	for (i = 0; i < linereq.num_lines; i++)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   952  		line->edets[i].line = line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   953  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   954  	line->gdev = gdev;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   955  	get_device(&gdev->dev);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   956  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   957  	/* Make sure this is terminated */
> f3b3ae8752adc5 Kent Gibson 2020-06-23   958  	linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
> f3b3ae8752adc5 Kent Gibson 2020-06-23   959  	if (strlen(linereq.consumer)) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   960  		line->label = kstrdup(linereq.consumer, GFP_KERNEL);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   961  		if (!line->label) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   962  			ret = -ENOMEM;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   963  			goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   964  		}
> f3b3ae8752adc5 Kent Gibson 2020-06-23   965  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23   966  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   967  	mutex_init(&line->config_mutex);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   968  	init_waitqueue_head(&line->wait);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   969  	if (lc->edge_detection) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   970  		size = linereq.event_buffer_size;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   971  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   972  		if (size > GPIOLINES_MAX*16)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   973  			size = GPIOLINES_MAX*16;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   974  		else if (size == 0)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   975  			size = linereq.num_lines*16;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   976  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   977  		ret = kfifo_alloc(&line->events, size, GFP_KERNEL);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   978  		if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23   979  			goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   980  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   981  		line->edge_detection = lc->edge_detection;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   982  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23   983  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   984  	atomic_set(&line->seqno, 0);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   985  	line->num_descs = linereq.num_lines;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   986  	vals = (unsigned long *)lc->values.bitmap;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   987  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   988  	/* Request each GPIO */
> f3b3ae8752adc5 Kent Gibson 2020-06-23   989  	for (i = 0; i < linereq.num_lines; i++) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   990  		u32 offset = linereq.offsets[i];
> f3b3ae8752adc5 Kent Gibson 2020-06-23   991  		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   992  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   993  		if (IS_ERR(desc)) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23   994  			ret = PTR_ERR(desc);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   995  			goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23   996  		}
> f3b3ae8752adc5 Kent Gibson 2020-06-23   997  
> f3b3ae8752adc5 Kent Gibson 2020-06-23   998  		ret = gpiod_request(desc, line->label);
> f3b3ae8752adc5 Kent Gibson 2020-06-23   999  		if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1000  			goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1001  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1002  		line->descs[i] = desc;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1003  		gpioline_config_to_desc_flags(lc, &desc->flags);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1004  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1005  		ret = gpiod_set_transitory(desc, false);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1006  		if (ret < 0)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1007  			goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1008  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1009  		/*
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1010  		 * Lines have to be requested explicitly for input
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1011  		 * or output, else the line will be treated "as is".
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1012  		 */
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1013  		if (lc->flags & GPIOLINE_FLAG_V2_DIRECTION) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1014  			if (lc->direction == GPIOLINE_DIRECTION_OUTPUT) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1015  				int val = test_bit(i, vals);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1016  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1017  				ret = gpiod_direction_output(desc, val);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1018  				if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1019  					goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1020  			} else {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1021  				ret = gpiod_direction_input(desc);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1022  				if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1023  					goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1024  				ret = edge_detector_setup(&line->edets[i], lc);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1025  				if (ret)
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1026  					goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1027  			}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1028  		}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1029  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1030  		atomic_notifier_call_chain(&desc->gdev->notifier,
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1031  					   GPIOLINE_CHANGED_REQUESTED, desc);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1032  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1033  		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1034  			offset);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1035  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1036  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1037  	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1038  	if (fd < 0) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1039  		ret = fd;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1040  		goto out_free_line;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1041  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1042  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1043  	file = anon_inode_getfile("gpio-line",
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1044  				  &line_fileops,
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1045  				  line,
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1046  				  O_RDONLY | O_CLOEXEC);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1047  	if (IS_ERR(file)) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1048  		ret = PTR_ERR(file);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1049  		goto out_put_unused_fd;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1050  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1051  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1052  	linereq.fd = fd;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1053  	if (copy_to_user(ip, &linereq, sizeof(linereq))) {
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1054  		/*
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1055  		 * fput() will trigger the release() callback, so do not go onto
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1056  		 * the regular error cleanup path here.
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1057  		 */
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1058  		fput(file);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1059  		put_unused_fd(fd);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1060  		return -EFAULT;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1061  	}
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1062  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1063  	fd_install(fd, file);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1064  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1065  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1066  		line->num_descs);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1067  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1068  	return 0;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1069  
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1070  out_put_unused_fd:
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1071  	put_unused_fd(fd);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1072  out_free_line:
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1073  	line_free(line);
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1074  	return ret;
> f3b3ae8752adc5 Kent Gibson 2020-06-23  1075  }
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


