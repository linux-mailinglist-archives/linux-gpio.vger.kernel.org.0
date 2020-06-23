Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CF82059EA
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 19:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbgFWRpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 13:45:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38366 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733154AbgFWRpG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 13:45:06 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05NHLmEA013114;
        Tue, 23 Jun 2020 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=PekjVnYjWeHc72lSFDxfv/uVI/8njwHjhClNk5wTr3Q=;
 b=XzLjMPOMH0QnMYDl02yioPP+CxCuI3ooBY2P4ecIZ+3hcQhQAAGj+LWxD5P7CleFs3Op
 knC2kzy5iKJKdEXEWiEq9QsT2Yeg8szC1SmUtxu5Y6jVEuF/k00d4NUBjpbd8eiBZMVC
 EqjDrzTXwVwULncp0UN32Q4tmbfioLE531xIeW1njPi9nvgxHdX8YP+DsMGpFyykqwhZ
 zAVox9RtQYf/9vxSruze3UpCL3/5wfwCCFDwxY/yLEwNB1ZQM4mOJO5J3uiWnNdBF+79
 tvJUUkdW20tECC0ZXDpgdZsEKb2Zm48OVHh7b/z1tDTLXYQFeDUPhUekvkS22m0sRoEi OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31uk3c19tp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jun 2020 17:44:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05NHO2Nk128429;
        Tue, 23 Jun 2020 17:44:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 31uk3h15vn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Jun 2020 17:44:49 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05NHilxk010839;
        Tue, 23 Jun 2020 17:44:47 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 23 Jun 2020 17:44:45 +0000
Date:   Tue, 23 Jun 2020 20:44:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Kent Gibson <warthog618@gmail.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH 16/22] gpiolib: cdev: add V2 uAPI implementation to
 parity with V1
Message-ID: <20200623174438.GL4151@kadam>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SvF6CGw9fzJC4Rcx"
Content-Disposition: inline
In-Reply-To: <20200623040107.22270-17-warthog618@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006120000
 definitions=main-2006230123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006120000
 definitions=main-2006230123
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--SvF6CGw9fzJC4Rcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[ The copy_to_user() overflow code is weird.  Why do we need to do a
  atomic_read()?  That suggests that there is a potential time of check
  time of use bug where we do:

	if (atomic_read(&gcdev->watch_abi_version) == 2) // <<-- time of check
		event_size = sizeof(struct gpioline_info_changed_v2);

	...

	if (atomic_read(&gcdev->watch_abi_version) == 2) { // <<-- time of use
		copy_to_user(blah, blah, event_size);

  If the value for "gcdev->watch_abi_version" changes between the time
  of check and the time of use then it can read beyond the end of the
  buffer.

  -- dan ]

Hi Kent,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Kent-Gibson/gpio-cdev-add-uAPI-V2/20200623-120634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: openrisc-randconfig-m031-20200623 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpio/gpiolib-cdev.c:891 line_free() error: dereferencing freed memory 'line'
drivers/gpio/gpiolib-cdev.c:949 line_create() warn: possible memory leak of 'line'
drivers/gpio/gpiolib-cdev.c:1860 lineinfo_watch_read() error: copy_to_user() '&event_v1' too small (104 vs 168)

# https://github.com/0day-ci/linux/commit/f3b3ae8752adc5ac33dcf83d49b0b02f2d7ef43b
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f3b3ae8752adc5ac33dcf83d49b0b02f2d7ef43b
vim +/line +891 drivers/gpio/gpiolib-cdev.c

f3b3ae8752adc5 Kent Gibson 2020-06-23   877  static void line_free(struct line *line)
f3b3ae8752adc5 Kent Gibson 2020-06-23   878  {
f3b3ae8752adc5 Kent Gibson 2020-06-23   879  	int i;
f3b3ae8752adc5 Kent Gibson 2020-06-23   880  
f3b3ae8752adc5 Kent Gibson 2020-06-23   881  	for (i = 0; i < line->num_descs; i++) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   882  		if (line->edets)
f3b3ae8752adc5 Kent Gibson 2020-06-23   883  			edge_detector_stop(&line->edets[i]);
f3b3ae8752adc5 Kent Gibson 2020-06-23   884  		if (line->descs[i])
f3b3ae8752adc5 Kent Gibson 2020-06-23   885  			gpiod_free(line->descs[i]);
f3b3ae8752adc5 Kent Gibson 2020-06-23   886  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23   887  	kfifo_free(&line->events);
f3b3ae8752adc5 Kent Gibson 2020-06-23   888  	kfree(line->label);
f3b3ae8752adc5 Kent Gibson 2020-06-23   889  	kfree(line->edets);
f3b3ae8752adc5 Kent Gibson 2020-06-23   890  	kfree(line);
f3b3ae8752adc5 Kent Gibson 2020-06-23  @891  	put_device(&line->gdev->dev);
f3b3ae8752adc5 Kent Gibson 2020-06-23   892  }
f3b3ae8752adc5 Kent Gibson 2020-06-23   893  
f3b3ae8752adc5 Kent Gibson 2020-06-23   894  static int line_release(struct inode *inode, struct file *file)
f3b3ae8752adc5 Kent Gibson 2020-06-23   895  {
f3b3ae8752adc5 Kent Gibson 2020-06-23   896  	struct line *line = file->private_data;
f3b3ae8752adc5 Kent Gibson 2020-06-23   897  
f3b3ae8752adc5 Kent Gibson 2020-06-23   898  	line_free(line);
f3b3ae8752adc5 Kent Gibson 2020-06-23   899  	return 0;
f3b3ae8752adc5 Kent Gibson 2020-06-23   900  }
f3b3ae8752adc5 Kent Gibson 2020-06-23   901  
f3b3ae8752adc5 Kent Gibson 2020-06-23   902  static const struct file_operations line_fileops = {
f3b3ae8752adc5 Kent Gibson 2020-06-23   903  	.release = line_release,
f3b3ae8752adc5 Kent Gibson 2020-06-23   904  	.read = line_read,
f3b3ae8752adc5 Kent Gibson 2020-06-23   905  	.poll = line_poll,
f3b3ae8752adc5 Kent Gibson 2020-06-23   906  	.owner = THIS_MODULE,
f3b3ae8752adc5 Kent Gibson 2020-06-23   907  	.llseek = noop_llseek,
f3b3ae8752adc5 Kent Gibson 2020-06-23   908  	.unlocked_ioctl = line_ioctl,
f3b3ae8752adc5 Kent Gibson 2020-06-23   909  #ifdef CONFIG_COMPAT
f3b3ae8752adc5 Kent Gibson 2020-06-23   910  	.compat_ioctl = line_ioctl_compat,
f3b3ae8752adc5 Kent Gibson 2020-06-23   911  #endif
f3b3ae8752adc5 Kent Gibson 2020-06-23   912  };
f3b3ae8752adc5 Kent Gibson 2020-06-23   913  
f3b3ae8752adc5 Kent Gibson 2020-06-23   914  static int line_create(struct gpio_device *gdev, void __user *ip)
f3b3ae8752adc5 Kent Gibson 2020-06-23   915  {
f3b3ae8752adc5 Kent Gibson 2020-06-23   916  	struct gpioline_request linereq;
f3b3ae8752adc5 Kent Gibson 2020-06-23   917  	struct line *line;
f3b3ae8752adc5 Kent Gibson 2020-06-23   918  	struct file *file;
f3b3ae8752adc5 Kent Gibson 2020-06-23   919  	int fd, i, ret, size;
f3b3ae8752adc5 Kent Gibson 2020-06-23   920  	struct gpioline_config *lc;
f3b3ae8752adc5 Kent Gibson 2020-06-23   921  	unsigned long *vals;
f3b3ae8752adc5 Kent Gibson 2020-06-23   922  
f3b3ae8752adc5 Kent Gibson 2020-06-23   923  	if (copy_from_user(&linereq, ip, sizeof(linereq)))
f3b3ae8752adc5 Kent Gibson 2020-06-23   924  		return -EFAULT;
f3b3ae8752adc5 Kent Gibson 2020-06-23   925  	if ((linereq.num_lines == 0) || (linereq.num_lines > GPIOLINES_MAX))
f3b3ae8752adc5 Kent Gibson 2020-06-23   926  		return -EINVAL;
f3b3ae8752adc5 Kent Gibson 2020-06-23   927  
f3b3ae8752adc5 Kent Gibson 2020-06-23   928  	if (padding_not_zeroed(linereq.padding, GPIOLINE_REQUEST_PAD_SIZE))
f3b3ae8752adc5 Kent Gibson 2020-06-23   929  		return -EINVAL;
f3b3ae8752adc5 Kent Gibson 2020-06-23   930  
f3b3ae8752adc5 Kent Gibson 2020-06-23   931  	lc = &linereq.config;
f3b3ae8752adc5 Kent Gibson 2020-06-23   932  	ret = gpioline_config_validate(lc);
f3b3ae8752adc5 Kent Gibson 2020-06-23   933  	if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23   934  		return ret;
f3b3ae8752adc5 Kent Gibson 2020-06-23   935  
f3b3ae8752adc5 Kent Gibson 2020-06-23   936  	/* event_buffer_size only valid with edge_detection */
f3b3ae8752adc5 Kent Gibson 2020-06-23   937  	if ((linereq.event_buffer_size) &&
f3b3ae8752adc5 Kent Gibson 2020-06-23   938  	    !(linereq.config.flags & GPIOLINE_FLAG_V2_EDGE_DETECTION))
f3b3ae8752adc5 Kent Gibson 2020-06-23   939  		return -EINVAL;
f3b3ae8752adc5 Kent Gibson 2020-06-23   940  
f3b3ae8752adc5 Kent Gibson 2020-06-23   941  	line = kzalloc(struct_size(line, descs, linereq.num_lines),
f3b3ae8752adc5 Kent Gibson 2020-06-23   942  		       GFP_KERNEL);
f3b3ae8752adc5 Kent Gibson 2020-06-23   943  	if (!line)
f3b3ae8752adc5 Kent Gibson 2020-06-23   944  		return -ENOMEM;
f3b3ae8752adc5 Kent Gibson 2020-06-23   945  
f3b3ae8752adc5 Kent Gibson 2020-06-23   946  	line->edets = kcalloc(linereq.num_lines, sizeof(*line->edets),
f3b3ae8752adc5 Kent Gibson 2020-06-23   947  			      GFP_KERNEL);
f3b3ae8752adc5 Kent Gibson 2020-06-23   948  	if (!line->edets)
f3b3ae8752adc5 Kent Gibson 2020-06-23  @949  		return -ENOMEM;
                                                        ^^^^^^^^^^^^^^^
kfree(line) before returning.

f3b3ae8752adc5 Kent Gibson 2020-06-23   950  
f3b3ae8752adc5 Kent Gibson 2020-06-23   951  	for (i = 0; i < linereq.num_lines; i++)
f3b3ae8752adc5 Kent Gibson 2020-06-23   952  		line->edets[i].line = line;
f3b3ae8752adc5 Kent Gibson 2020-06-23   953  
f3b3ae8752adc5 Kent Gibson 2020-06-23   954  	line->gdev = gdev;
f3b3ae8752adc5 Kent Gibson 2020-06-23   955  	get_device(&gdev->dev);
f3b3ae8752adc5 Kent Gibson 2020-06-23   956  
f3b3ae8752adc5 Kent Gibson 2020-06-23   957  	/* Make sure this is terminated */
f3b3ae8752adc5 Kent Gibson 2020-06-23   958  	linereq.consumer[sizeof(linereq.consumer)-1] = '\0';
f3b3ae8752adc5 Kent Gibson 2020-06-23   959  	if (strlen(linereq.consumer)) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   960  		line->label = kstrdup(linereq.consumer, GFP_KERNEL);
f3b3ae8752adc5 Kent Gibson 2020-06-23   961  		if (!line->label) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   962  			ret = -ENOMEM;
f3b3ae8752adc5 Kent Gibson 2020-06-23   963  			goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23   964  		}
f3b3ae8752adc5 Kent Gibson 2020-06-23   965  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23   966  
f3b3ae8752adc5 Kent Gibson 2020-06-23   967  	mutex_init(&line->config_mutex);
f3b3ae8752adc5 Kent Gibson 2020-06-23   968  	init_waitqueue_head(&line->wait);
f3b3ae8752adc5 Kent Gibson 2020-06-23   969  	if (lc->edge_detection) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   970  		size = linereq.event_buffer_size;
f3b3ae8752adc5 Kent Gibson 2020-06-23   971  
f3b3ae8752adc5 Kent Gibson 2020-06-23   972  		if (size > GPIOLINES_MAX*16)
f3b3ae8752adc5 Kent Gibson 2020-06-23   973  			size = GPIOLINES_MAX*16;
f3b3ae8752adc5 Kent Gibson 2020-06-23   974  		else if (size == 0)
f3b3ae8752adc5 Kent Gibson 2020-06-23   975  			size = linereq.num_lines*16;
f3b3ae8752adc5 Kent Gibson 2020-06-23   976  
f3b3ae8752adc5 Kent Gibson 2020-06-23   977  		ret = kfifo_alloc(&line->events, size, GFP_KERNEL);
f3b3ae8752adc5 Kent Gibson 2020-06-23   978  		if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23   979  			goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23   980  
f3b3ae8752adc5 Kent Gibson 2020-06-23   981  		line->edge_detection = lc->edge_detection;
f3b3ae8752adc5 Kent Gibson 2020-06-23   982  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23   983  
f3b3ae8752adc5 Kent Gibson 2020-06-23   984  	atomic_set(&line->seqno, 0);
f3b3ae8752adc5 Kent Gibson 2020-06-23   985  	line->num_descs = linereq.num_lines;
f3b3ae8752adc5 Kent Gibson 2020-06-23   986  	vals = (unsigned long *)lc->values.bitmap;
f3b3ae8752adc5 Kent Gibson 2020-06-23   987  
f3b3ae8752adc5 Kent Gibson 2020-06-23   988  	/* Request each GPIO */
f3b3ae8752adc5 Kent Gibson 2020-06-23   989  	for (i = 0; i < linereq.num_lines; i++) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   990  		u32 offset = linereq.offsets[i];
f3b3ae8752adc5 Kent Gibson 2020-06-23   991  		struct gpio_desc *desc = gpiochip_get_desc(gdev->chip, offset);
f3b3ae8752adc5 Kent Gibson 2020-06-23   992  
f3b3ae8752adc5 Kent Gibson 2020-06-23   993  		if (IS_ERR(desc)) {
f3b3ae8752adc5 Kent Gibson 2020-06-23   994  			ret = PTR_ERR(desc);
f3b3ae8752adc5 Kent Gibson 2020-06-23   995  			goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23   996  		}
f3b3ae8752adc5 Kent Gibson 2020-06-23   997  
f3b3ae8752adc5 Kent Gibson 2020-06-23   998  		ret = gpiod_request(desc, line->label);
f3b3ae8752adc5 Kent Gibson 2020-06-23   999  		if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23  1000  			goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1001  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1002  		line->descs[i] = desc;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1003  		gpioline_config_to_desc_flags(lc, &desc->flags);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1004  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1005  		ret = gpiod_set_transitory(desc, false);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1006  		if (ret < 0)
f3b3ae8752adc5 Kent Gibson 2020-06-23  1007  			goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1008  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1009  		/*
f3b3ae8752adc5 Kent Gibson 2020-06-23  1010  		 * Lines have to be requested explicitly for input
f3b3ae8752adc5 Kent Gibson 2020-06-23  1011  		 * or output, else the line will be treated "as is".
f3b3ae8752adc5 Kent Gibson 2020-06-23  1012  		 */
f3b3ae8752adc5 Kent Gibson 2020-06-23  1013  		if (lc->flags & GPIOLINE_FLAG_V2_DIRECTION) {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1014  			if (lc->direction == GPIOLINE_DIRECTION_OUTPUT) {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1015  				int val = test_bit(i, vals);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1016  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1017  				ret = gpiod_direction_output(desc, val);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1018  				if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23  1019  					goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1020  			} else {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1021  				ret = gpiod_direction_input(desc);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1022  				if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23  1023  					goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1024  				ret = edge_detector_setup(&line->edets[i], lc);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1025  				if (ret)
f3b3ae8752adc5 Kent Gibson 2020-06-23  1026  					goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1027  			}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1028  		}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1029  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1030  		atomic_notifier_call_chain(&desc->gdev->notifier,
f3b3ae8752adc5 Kent Gibson 2020-06-23  1031  					   GPIOLINE_CHANGED_REQUESTED, desc);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1032  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1033  		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
f3b3ae8752adc5 Kent Gibson 2020-06-23  1034  			offset);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1035  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1036  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1037  	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1038  	if (fd < 0) {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1039  		ret = fd;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1040  		goto out_free_line;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1041  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1042  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1043  	file = anon_inode_getfile("gpio-line",
f3b3ae8752adc5 Kent Gibson 2020-06-23  1044  				  &line_fileops,
f3b3ae8752adc5 Kent Gibson 2020-06-23  1045  				  line,
f3b3ae8752adc5 Kent Gibson 2020-06-23  1046  				  O_RDONLY | O_CLOEXEC);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1047  	if (IS_ERR(file)) {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1048  		ret = PTR_ERR(file);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1049  		goto out_put_unused_fd;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1050  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1051  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1052  	linereq.fd = fd;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1053  	if (copy_to_user(ip, &linereq, sizeof(linereq))) {
f3b3ae8752adc5 Kent Gibson 2020-06-23  1054  		/*
f3b3ae8752adc5 Kent Gibson 2020-06-23  1055  		 * fput() will trigger the release() callback, so do not go onto
f3b3ae8752adc5 Kent Gibson 2020-06-23  1056  		 * the regular error cleanup path here.
f3b3ae8752adc5 Kent Gibson 2020-06-23  1057  		 */
f3b3ae8752adc5 Kent Gibson 2020-06-23  1058  		fput(file);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1059  		put_unused_fd(fd);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1060  		return -EFAULT;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1061  	}
f3b3ae8752adc5 Kent Gibson 2020-06-23  1062  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1063  	fd_install(fd, file);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1064  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1065  	dev_dbg(&gdev->dev, "registered chardev handle for %d lines\n",
f3b3ae8752adc5 Kent Gibson 2020-06-23  1066  		line->num_descs);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1067  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1068  	return 0;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1069  
f3b3ae8752adc5 Kent Gibson 2020-06-23  1070  out_put_unused_fd:
f3b3ae8752adc5 Kent Gibson 2020-06-23  1071  	put_unused_fd(fd);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1072  out_free_line:
f3b3ae8752adc5 Kent Gibson 2020-06-23  1073  	line_free(line);
f3b3ae8752adc5 Kent Gibson 2020-06-23  1074  	return ret;
f3b3ae8752adc5 Kent Gibson 2020-06-23  1075  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--SvF6CGw9fzJC4Rcx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--SvF6CGw9fzJC4Rcx--
