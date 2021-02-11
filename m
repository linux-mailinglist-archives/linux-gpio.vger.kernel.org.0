Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C1A318A0D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 13:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhBKMEl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 07:04:41 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42250 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhBKMCV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 07:02:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BBmu7I193682;
        Thu, 11 Feb 2021 12:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=JlHMtwzoGJad+lRl/QAFsxOviAa1mqmYy7Gmfhb0yxA=;
 b=yLKjGowP88OgerhM4QsQJ+nql7HBpLv3Qt6SQOJHvqzEYiDTdnfaGA1S/GgAJm8qtKlZ
 BaTvzdUqf2UYVFjzopxB+4dQmmNhOkPnUYgwg2+EOTWbR3NXkpiR3a+iRfk4nswELsoD
 phirJNPMNuTgdsJEqMczW9vDDE0//q1/Sc6Hs15cEWE5IUdwT19ZuhtnE1ZjdTBkVuaf
 rJyzwMvow6OJmTkVYyKR28wzlzkexGHd1LUfQu/gSANThi4F0C6QA+/QjdoZdWtP/ZcB
 l95IuEuzzLFmKEd/3Sae552n5VP5Uy6M+dHo8U6/mAlyK7zyq5fFECuXvpP6nOEhqJQS og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 36mv9dsc6v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 12:01:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11BBolL2143114;
        Thu, 11 Feb 2021 12:01:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 36j4vu5h33-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Feb 2021 12:01:12 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11BC16ou027776;
        Thu, 11 Feb 2021 12:01:06 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 11 Feb 2021 04:01:05 -0800
Date:   Thu, 11 Feb 2021 15:00:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 2/2] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <20210211120051.GN20820@kadam>
References: <20210210222851.232374-1-drew@beagleboard.org>
 <20210210222851.232374-3-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210222851.232374-3-drew@beagleboard.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102110108
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9891 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102110108
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2021 at 02:28:54PM -0800, Drew Fustini wrote:
> Add "pinmux-select" to debugfs which will activate a function and group
> when "<function-name group-name>" are written to the file. The write
> operation pinmux_select() handles this by checking that the names map to
> valid selectors and then calling ops->set_mux().
> 
> The existing "pinmux-functions" debugfs file lists the pin functions
> registered for the pin controller. For example:
> 
> function: pinmux-uart0, groups = [ pinmux-uart0-pins ]
> function: pinmux-mmc0, groups = [ pinmux-mmc0-pins ]
> function: pinmux-mmc1, groups = [ pinmux-mmc1-pins ]
> function: pinmux-i2c0, groups = [ pinmux-i2c0-pins ]
> function: pinmux-i2c1, groups = [ pinmux-i2c1-pins ]
> function: pinmux-spi1, groups = [ pinmux-spi1-pins ]
> 
> To activate function pinmux-i2c1 and group pinmux-i2c1-pins:
> 
> echo "pinmux-i2c1 pinmux-i2c1-pins" > pinmux-select
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  drivers/pinctrl/pinmux.c | 107 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> index c651b2db0925..23fa32f0a067 100644
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -673,6 +673,111 @@ void pinmux_show_setting(struct seq_file *s,
>  DEFINE_SHOW_ATTRIBUTE(pinmux_functions);
>  DEFINE_SHOW_ATTRIBUTE(pinmux_pins);
>  
> +#define PINMUX_MAX_NAME 64
> +static ssize_t pinmux_select(struct file *file, const char __user *user_buf,
> +				   size_t len, loff_t *ppos)
> +{
> +	struct seq_file *sfile = file->private_data;
> +	struct pinctrl_dev *pctldev = sfile->private;
> +	const struct pinmux_ops *pmxops = pctldev->desc->pmxops;
> +	const char *const *groups;
> +	char *buf, *fname, *gname;
> +	unsigned int num_groups;
> +	int fsel, gsel, ret;
> +
> +	if (len > (PINMUX_MAX_NAME * 2)) {
> +		dev_err(pctldev->dev, "write too big for buffer");
> +		return -EINVAL;
> +	}
> +
> +	buf = kzalloc(PINMUX_MAX_NAME * 2, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	fname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> +	if (!fname) {
> +		ret = -ENOMEM;
> +		goto free_buf;
> +	}
> +
> +	gname = kzalloc(PINMUX_MAX_NAME, GFP_KERNEL);
> +	if (!buf) {
> +		ret = -ENOMEM;
> +		goto free_fname;
> +	}
> +
> +	ret = strncpy_from_user(buf, user_buf, PINMUX_MAX_NAME * 2);
> +	if (ret < 0) {
> +		dev_err(pctldev->dev, "failed to copy buffer from userspace");
> +		goto free_gname;
> +	}
> +	buf[len-1] = '\0';
> +
> +	ret = sscanf(buf, "%s %s", fname, gname);
> +	if (ret != 2) {
> +		dev_err(pctldev->dev, "expected format: <function-name> <group-name>");
> +		goto free_gname;
> +	}
> +
> +	fsel = pinmux_func_name_to_selector(pctldev, fname);
> +	if (fsel < 0) {
> +		dev_err(pctldev->dev, "invalid function %s in map table\n", fname);
> +		ret = -EINVAL;
> +		goto free_gname;
> +	}
> +
> +	ret = pmxops->get_function_groups(pctldev, fsel, &groups, &num_groups);
> +	if (ret) {
> +		dev_err(pctldev->dev, "no groups for function %d (%s)", fsel, fname);
> +		goto free_gname;
> +
> +	}
> +
> +	ret = match_string(groups, num_groups, gname);
> +	if (ret < 0) {
> +		dev_err(pctldev->dev, "invalid group %s", gname);
> +		goto free_gname;
> +	}
> +
> +	ret = pinctrl_get_group_selector(pctldev, gname);
> +	if (ret < 0) {
> +		dev_err(pctldev->dev, "failed to get group selectorL %s", gname);
> +		goto free_gname;
> +	}
> +	gsel = ret;
> +
> +	ret = pmxops->set_mux(pctldev, fsel, gsel);
> +	if (ret) {
> +		dev_err(pctldev->dev, "set_mux() failed: %d", ret);
> +		goto free_gname;
> +	}
> +
> +	return len;
> +
> +free_gname:
> +	devm_kfree(pctldev->dev, gname);
> +free_fname:
> +	devm_kfree(pctldev->dev, fname);
> +free_buf:
> +	devm_kfree(pctldev->dev, buf);

Ugh...  I honestly thought Smatch was supposed to print a warning when
you used devm_kfree() on kzalloc()ed memory, but I guess the warning is
only the other way around.

Smatch does complain about it as a leak because it was expecting a
regular free.

drivers/pinctrl/pinmux.c:330 pinmux_func_name_to_selector() warn: potential NULL parameter dereference 'fname'
drivers/pinctrl/pinmux.c:764 pinmux_select() warn: possible memory leak of 'gname'
drivers/pinctrl/pinmux.c:764 pinmux_select() warn: sscanf doesn't return error codes
drivers/pinctrl/pinmux.c:764 pinmux_select() warn: returning success when sscanf failed

And what about the success path?  Shouldn't we free these on the success
path as well?

regards,
dan carpenter

