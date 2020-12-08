Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977312D28A7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 11:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728956AbgLHKSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 05:18:34 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40768 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbgLHKSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 05:18:32 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8A9wAU017871;
        Tue, 8 Dec 2020 10:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=CrNk+1mbj+kIOENVQanyHPlDiySaYqaUJlvtN/mqJ54=;
 b=vH9zLyUQXSpNv8ogNouX7eZ876ou09jPSekcXcJaoXTJnQCMFXUqeq4ug5ramzgicGAw
 nbx3BfSpwt2gjMU/dVy8wHrPMiETatOOcXknF/aCG6zbt97aVoiwJG2fIGi/7Q7Hgpz+
 a4G+TvWZHKFk0jfLJiR4nEC6a+RadP2pHaiRb0fs4r9JBHaAAMWSw1ewBaOP9FaobPw/
 rse8ITOE3KOwufN4m2fq24OuzS1ekihXWsWFo8MluUxl8j9P/k75YERvvFdbjF00g9fe
 i78M9GMP3XM3ucAIJ4J0rjcBxhfW8RdH8oN99FHiDrBmH4gX3PNXWNBg+AQ3uMknKDAI bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 3581mqt1vd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 08 Dec 2020 10:17:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B8AAe7i068001;
        Tue, 8 Dec 2020 10:17:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 358kysnbj4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 08 Dec 2020 10:17:38 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B8AHbPC024867;
        Tue, 8 Dec 2020 10:17:37 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 08 Dec 2020 02:17:36 -0800
Date:   Tue, 8 Dec 2020 13:17:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linus.walleij@linaro.org, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, yanaijie@huawei.com,
        gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: ralink: add a pinctrl driver for the rt2880
 family
Message-ID: <20201208101728.GZ2767@kadam>
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
 <20201207192104.6046-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207192104.6046-3-sergio.paracuellos@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012080063
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080063
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 07, 2020 at 08:21:03PM +0100, Sergio Paracuellos wrote:
> +static struct pinctrl_desc rt2880_pctrl_desc = {
> +	.owner		= THIS_MODULE,
> +	.name		= "rt2880-pinmux",
> +	.pctlops	= &rt2880_pctrl_ops,
> +	.pmxops		= &rt2880_pmx_group_ops,
> +};
> +
> +static struct rt2880_pmx_func gpio_func = {
> +	.name = "gpio",
> +};
> +
> +static int rt2880_pinmux_index(struct rt2880_priv *p)


This function name is not great.  I assumed that it would return the
index.

> +{
> +	struct rt2880_pmx_func **f;

Get rid of this "f" variable and use "p->func" instead.

> +	struct rt2880_pmx_group *mux = p->groups;
> +	int i, j, c = 0;
> +
> +	/* count the mux functions */
> +	while (mux->name) {
> +		p->group_count++;
> +		mux++;
> +	}
> +
> +	/* allocate the group names array needed by the gpio function */
> +	p->group_names = devm_kcalloc(p->dev, p->group_count,
> +				      sizeof(char *), GFP_KERNEL);
> +	if (!p->group_names)
> +		return -1;

Return proper error codes in this function.  s/-1/-ENOMEM/

> +
> +	for (i = 0; i < p->group_count; i++) {
> +		p->group_names[i] = p->groups[i].name;
> +		p->func_count += p->groups[i].func_count;
> +	}
> +
> +	/* we have a dummy function[0] for gpio */
> +	p->func_count++;
> +
> +	/* allocate our function and group mapping index buffers */
> +	f = p->func = devm_kcalloc(p->dev,
> +				   p->func_count,
> +				   sizeof(*p->func),
> +				   GFP_KERNEL);
> +	gpio_func.groups = devm_kcalloc(p->dev, p->group_count, sizeof(int),
> +					GFP_KERNEL);
> +	if (!f || !gpio_func.groups)
> +		return -1;
> +
> +	/* add a backpointer to the function so it knows its group */
> +	gpio_func.group_count = p->group_count;
> +	for (i = 0; i < gpio_func.group_count; i++)
> +		gpio_func.groups[i] = i;
> +
> +	f[c] = &gpio_func;
> +	c++;
> +
> +	/* add remaining functions */
> +	for (i = 0; i < p->group_count; i++) {
> +		for (j = 0; j < p->groups[i].func_count; j++) {
> +			f[c] = &p->groups[i].func[j];
> +			f[c]->groups = devm_kzalloc(p->dev, sizeof(int),
> +						    GFP_KERNEL);

Add a NULL check.

> +			f[c]->groups[0] = i;
> +			f[c]->group_count = 1;
> +			c++;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int rt2880_pinmux_pins(struct rt2880_priv *p)
> +{
> +	int i, j;
> +
> +	/*
> +	 * loop over the functions and initialize the pins array.
> +	 * also work out the highest pin used.
> +	 */
> +	for (i = 0; i < p->func_count; i++) {
> +		int pin;
> +
> +		if (!p->func[i]->pin_count)
> +			continue;
> +
> +		p->func[i]->pins = devm_kcalloc(p->dev,
> +						p->func[i]->pin_count,
> +						sizeof(int),
> +						GFP_KERNEL);

This can fit on two lines.

		p->func[i]->pins = devm_kcalloc(p->dev, p->func[i]->pin_count,
						sizeof(int), GFP_KERNEL);

> +		for (j = 0; j < p->func[i]->pin_count; j++)
> +			p->func[i]->pins[j] = p->func[i]->pin_first + j;
> +
> +		pin = p->func[i]->pin_first + p->func[i]->pin_count;
> +		if (pin > p->max_pins)
> +			p->max_pins = pin;
> +	}
> +
> +	/* the buffer that tells us which pins are gpio */
> +	p->gpio = devm_kcalloc(p->dev, p->max_pins, sizeof(u8), GFP_KERNEL);
> +	/* the pads needed to tell pinctrl about our pins */
> +	p->pads = devm_kcalloc(p->dev, p->max_pins,
> +			       sizeof(struct pinctrl_pin_desc), GFP_KERNEL);
> +	if (!p->pads || !p->gpio) {
> +		dev_err(p->dev, "Failed to allocate gpio data\n");

Delete this error message.  #checkpatch.pl

> +		return -ENOMEM;
> +	}
> +
> +	memset(p->gpio, 1, sizeof(u8) * p->max_pins);
> +	for (i = 0; i < p->func_count; i++) {
> +		if (!p->func[i]->pin_count)
> +			continue;
> +
> +		for (j = 0; j < p->func[i]->pin_count; j++)
> +			p->gpio[p->func[i]->pins[j]] = 0;
> +	}
> +
> +	/* pin 0 is always a gpio */
> +	p->gpio[0] = 1;
> +
> +	/* set the pads */
> +	for (i = 0; i < p->max_pins; i++) {
> +		/* strlen("ioXY") + 1 = 5 */
> +		char *name = devm_kzalloc(p->dev, 5, GFP_KERNEL);
> +

		char *name;

		name = kasprintf(GFP_KERNEL, "io%d", i);


> +		if (!name)
> +			return -ENOMEM;
> +		snprintf(name, 5, "io%d", i);
> +		p->pads[i].number = i;
> +		p->pads[i].name = name;
> +	}
> +	p->desc->pins = p->pads;
> +	p->desc->npins = p->max_pins;
> +
> +	return 0;
> +}
> +
> +static int rt2880_pinmux_probe(struct platform_device *pdev)
> +{
> +	struct rt2880_priv *p;
> +	struct pinctrl_dev *dev;
> +
> +	if (!rt2880_pinmux_data)
> +		return -ENOTSUPP;
> +
> +	/* setup the private data */
> +	p = devm_kzalloc(&pdev->dev, sizeof(struct rt2880_priv), GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	p->dev = &pdev->dev;
> +	p->desc = &rt2880_pctrl_desc;
> +	p->groups = rt2880_pinmux_data;
> +	platform_set_drvdata(pdev, p);
> +
> +	/* init the device */
> +	if (rt2880_pinmux_index(p)) {
> +		dev_err(&pdev->dev, "failed to load index\n");
> +		return -EINVAL;

Preserve the error code:

	err = rt2880_pinmux_index(p);
	if (err) {
		dev_err(&pdev->dev, "failed to load index\n");
		return err;
	}


> +	}
> +	if (rt2880_pinmux_pins(p)) {
> +		dev_err(&pdev->dev, "failed to load pins\n");
> +		return -EINVAL;

Same.

> +	}
> +	dev = pinctrl_register(p->desc, &pdev->dev, p);
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	return 0;
> +}

regards,
dan carpenter
