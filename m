Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2DAE6F8FD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfGVFmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:42:24 -0400
Received: from de-outgoing-9-9.antispam.co.za ([176.9.211.72]:57471 "EHLO
        de-outgoing-9-9.antispam.co.za" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbfGVFmY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:42:24 -0400
X-Greylist: delayed 3006 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Jul 2019 01:42:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=out.zamailgate.com; s=default; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:reply-to:sender:bcc:
        content-transfer-encoding; bh=64rd6IcL4fIvhgRr6XOO4DL/7sQXmNzxzRnPBY2jfQk=;
         b=L3CjuWDHIwShCB5bpxjSJht8oQixNBj5slrqtGgfANKSNvjuJUINVVyC+D5V5dXbR/FqG205S9
        L6QeM6RHvUV0GNfv1Zv69qRL8MTidc6MMvKnqrm4KvTIdzFuIxntoKFsLTWz9C/BduV64a3n2/Y0G
        qR14EPTd0Cag7LB9SqP0=;
Received: from cp46-jhb.za-dns.com ([164.160.91.39])
        by server9.antispam.co.za with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpQJ2-00056O-1l; Mon, 22 Jul 2019 06:52:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=bitlabs.co.za; s=default; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=64rd6IcL4fIvhgRr6XOO4DL/7sQXmNzxzRnPBY2jfQk=; b=EowshLDlwAR1WpTaG97aiXoD8
        Wpza/OlzRTwNpaHk5+qGSMFHtYBaY1xkpAKtaInXgJt5HnI9Yukq1iCjPpGkK8gYYCu+dzhEGeOYX
        CvtDZLaxKwqJATXuOff2MD4meOmPaS5OqDAmuukmoM3Oo1EEW8fIDe2CjqF2AVlsIjAZl07DN9m2O
        iGSk6riwjQS2QTLiYZ+qiY3bOxuDJbKkdkEvRiZngddOHTS6hiiGtlx2J3OHyycXdVckxsmNaNoVz
        IxHy44H2ha4rfefRM4VWE4VRfIgBq9yhct0G7XFdWHEg/ZQUUJY0bTDxTqziBLtjKIQTj2kGrSgWY
        TGmMgVVVQ==;
Received: from [45.56.148.82] (port=48840 helo=manjaro-1)
        by cp46-jhb.za-dns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <hm@bitlabs.co.za>)
        id 1hpQIt-000838-Ls; Mon, 22 Jul 2019 06:52:04 +0200
Date:   Mon, 22 Jul 2019 06:51:54 +0200
From:   Hennie Muller <hm@bitlabs.co.za>
To:     Phil Reid <preid@electromag.com.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH] gpio: Replace usage of bare 'unsigned' with
 'unsigned int'
Message-ID: <20190722045154.rp2sqr2mxdmfn5qj@manjaro-1>
References: <20190721125259.13990-1-hm@bitlabs.co.za>
 <61045f29-73ca-cb62-ba6f-5b12970735a9@electromag.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61045f29-73ca-cb62-ba6f-5b12970735a9@electromag.com.au>
X-Get-Message-Sender-Via: cp46-jhb.za-dns.com: authenticated_id: hm@bitlabs.co.za
X-Authenticated-Sender: cp46-jhb.za-dns.com: hm@bitlabs.co.za
X-AuthUser: hm@bitlabs.co.za
X-AuthUsername: 
X-AuthDomain: @
X-Originating-IP: 164.160.91.39
X-SpamExperts-Domain: out.zamailgate.com
X-SpamExperts-Username: 164.160.91.39
Authentication-Results: antispam.co.za; auth=pass smtp.auth=164.160.91.39@out.zamailgate.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00588500935121)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0STiPCilqAig5bem4hJMKBmpSDasLI4SayDByyq9LIhV4Y5n+wxaLJoa
 DjtgDawDEUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KhT7D3SX4MPtDgdWqsPqh67fj
 DY1qm2QZcrcs82VGliYm1p42ppTj+dVCw4Ez5pDLW0+mKt/G7vFc2Qym1x4kT+asgSOJwXvEa88/
 nEEOQ8atQbfoTroPoLSOwm9gb/v9t8C9mOBdONdnsxgsk1D2py+4lO+qZiszEkuaXWZuy9K3wL2Y
 4F0412ezGCyTUPanTFg5blXwux8esyOqcBiI3QW3/JG4NvcugjYnCALrCN0QSvHD20fXtmqWXghn
 7qhhLHdtIZerlbr9J0URPm3qGw6xHJ+5XfpywqqK/49f0grSo+JqHSJMzPV2SO5XAS47CrfmSf0L
 i45/NZ9SxHqOKEOsySokoPKwLoxkVVV2B0lpzAs8/Yb7du19qZoD72lvi0rkK5IlwQ7ImbK6V1qP
 /QW1G9+Xy7Q00JXKZ6AIc+S4RopuYbYWODZPMXR7gq11OuEY1HqEhaucdkac1B9pHVpyEaauzOzF
 HT8EncIT+dZvUeASWefCYj15CRjPEXcLxvV0HqsoxHSXAJzPhyRQPuWBOXp8nHKe0R+FkIqN7hlK
 iJTN7QRHyTxFZxda0sg2lg6p7O4N5ohxmAZntqjk6urdeG3055AJ+1ulZSV7bJ5HZdYXq9nbB9YL
 buEdlZGH5xC0aagmRmHsEsxeqg0lAf3L1YQsC1MBMpAYEHWLAHlagrnUtxvpfJmdlkqpO2zU8mIy
 AWDzMaiksSFXUf2/opd7/V3RJl1jWFHiAL9S1hROvVB8ln8Gbd1wEveB/JxEFfQbvlTi88xSc9Qi
 UhgH3fdjzQ6YC7Heg3Xf7O1TOd4H0jB6orFsm4lpjwE/4C3BAcgNpD8B6zIYQ/YUyeje5GqgtqOb
 CvohvKzPGrrDEZtEzEL62+pmygRM4z6UNMVeXcEObgAeXh0ac70JoNe6uMV8Zu+UhKPbnYIx5kLg
 TOFM8jeeJSytG/Wf88r2kBub8U3Gy13zcBdnsFzxld/ykvUvuXdE8A+FdNrjckL3mHJSR5JV9DHC
 csU/tK0CUl/DxCo1rgS3Q2ym4AIoOdq5ermHZmPglR+swmDUp2F8oUst+qf6sGr/I71pJ09COraL
 SYuMFtB17GvS7LLvVpYvNA==
X-Report-Abuse-To: spam@server1.antispam.co.za
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 10:05:00AM +0800, Phil Reid wrote:
> G'day Hennie,
> 
> patch title should be:
> gpio: viperboard: Replace usage of bare 'unsigned' with 'unsigned int'
Thanks Phil.

I'll go read up a bit on amending commit messages for review.

> 
> On 21/07/2019 20:52, Hennie Muller wrote:
> > Fixes a couple of warnings by checkpatch and sparse.
> > 
> > Signed-off-by: Hennie Muller <hm@bitlabs.co.za>
> > ---
> >   drivers/gpio/gpio-viperboard.c | 20 ++++++++++----------
> >   1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
> > index 9b604f13e302..c301c1d56dd2 100644
> > --- a/drivers/gpio/gpio-viperboard.c
> > +++ b/drivers/gpio/gpio-viperboard.c
> > @@ -79,7 +79,7 @@ MODULE_PARM_DESC(gpioa_freq,
> >   /* ----- begin of gipo a chip -------------------------------------------- */
> >   static int vprbrd_gpioa_get(struct gpio_chip *chip,
> > -		unsigned offset)
> > +		unsigned int offset)
> 
> I've encountered these checkpatch warnings as well.
> 
> However 'struct gpio_chip' callbacks define the function signatures
> as 'unsigned', not 'unsigned int'. So I've also left them as is, to explicitly
> match the struct definition.
> 
> Be interested to know what the official take on this is.
In hindsight, I saw most of the other gpio drivers follow the same
convention as the viperboard driver. which means
a) my changes add no value and just creates inconsistency.
or
b) there's an opportunity to fix up the rest of the gpio drivers as
well? Which I'll be happy to do.

I'll be eagerly awaiting feedback.
> 
> 
> >   {
> >   	int ret, answer, error = 0;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -129,7 +129,7 @@ static int vprbrd_gpioa_get(struct gpio_chip *chip,
> >   }
> >   static void vprbrd_gpioa_set(struct gpio_chip *chip,
> > -		unsigned offset, int value)
> > +		unsigned int offset, int value)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -170,7 +170,7 @@ static void vprbrd_gpioa_set(struct gpio_chip *chip,
> >   }
> >   static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
> > -			unsigned offset)
> > +			unsigned int offset)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -207,7 +207,7 @@ static int vprbrd_gpioa_direction_input(struct gpio_chip *chip,
> >   }
> >   static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
> > -			unsigned offset, int value)
> > +			unsigned int offset, int value)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -251,8 +251,8 @@ static int vprbrd_gpioa_direction_output(struct gpio_chip *chip,
> >   /* ----- begin of gipo b chip -------------------------------------------- */
> > -static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
> > -	unsigned dir)
> > +static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned int offset,
> > +	unsigned int dir)
> >   {
> >   	struct vprbrd_gpiob_msg *gbmsg = (struct vprbrd_gpiob_msg *)vb->buf;
> >   	int ret;
> > @@ -273,7 +273,7 @@ static int vprbrd_gpiob_setdir(struct vprbrd *vb, unsigned offset,
> >   }
> >   static int vprbrd_gpiob_get(struct gpio_chip *chip,
> > -		unsigned offset)
> > +		unsigned int offset)
> >   {
> >   	int ret;
> >   	u16 val;
> > @@ -305,7 +305,7 @@ static int vprbrd_gpiob_get(struct gpio_chip *chip,
> >   }
> >   static void vprbrd_gpiob_set(struct gpio_chip *chip,
> > -		unsigned offset, int value)
> > +		unsigned int offset, int value)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -338,7 +338,7 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip,
> >   }
> >   static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
> > -			unsigned offset)
> > +			unsigned int offset)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > @@ -359,7 +359,7 @@ static int vprbrd_gpiob_direction_input(struct gpio_chip *chip,
> >   }
> >   static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
> > -			unsigned offset, int value)
> > +			unsigned int offset, int value)
> >   {
> >   	int ret;
> >   	struct vprbrd_gpio *gpio = gpiochip_get_data(chip);
> > 
> 
> 
> -- 
> Regards
> Phil Reid
