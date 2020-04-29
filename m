Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8094A1BD13E
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 02:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgD2AiS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 20:38:18 -0400
Received: from smtprelay0168.hostedemail.com ([216.40.44.168]:49328 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726401AbgD2AiS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 20:38:18 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8F1A8182251B0;
        Wed, 29 Apr 2020 00:38:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:2:41:69:355:379:599:966:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1593:1594:1605:1606:1730:1747:1777:1792:2194:2196:2199:2200:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3868:3870:3874:4117:4250:4321:4385:4605:5007:7875:7903:9592:10004:10848:11026:11232:11233:11473:11658:11914:12043:12296:12297:12438:12555:12683:12740:12760:12895:13161:13229:13439:13972:14096:14097:14659:21080:21627:21990:30054:30079:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:10,LUA_SUMMARY:none
X-HE-Tag: cup22_655f1c9524156
X-Filterd-Recvd-Size: 6222
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Wed, 29 Apr 2020 00:38:16 +0000 (UTC)
Message-ID: <a23b7a97f349e6f74b993a4e127564ad3f7d6929.camel@perches.com>
Subject: Re: [PATCH 2/2] gpio: Make "offset" and "unsigned int", not just
 "unsigned"
From:   Joe Perches <joe@perches.com>
To:     Douglas Anderson <dianders@chromium.org>, linus.walleij@linaro.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 28 Apr 2020 17:38:15 -0700
In-Reply-To: <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
References: <20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid>
         <20200428172322.2.Iacb3c8152c3cf9015a91308678155a578b0cc050@changeid>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2020-04-28 at 17:23 -0700, Douglas Anderson wrote:
> When I copied the function prototypes from the GPIO header file into
> my own driver, checkpatch yelled at me saying that I shouldn't use use
> "unsigned" but instead should say "unsigned int".  Let's make the
> header file use "unsigned int" so others who copy like I did won't get
> yelled at.

There are a few other unsigned declarations in the file.
Maybe do all of them (and remove the unnecessary externs)?

trivial reformatting of the function pointer block too
---
 include/linux/gpio/driver.h | 79 ++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 47 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b8fc92c..478fb0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -348,40 +348,26 @@ struct gpio_chip {
 	struct device		*parent;
 	struct module		*owner;
 
-	int			(*request)(struct gpio_chip *gc,
-						unsigned offset);
-	void			(*free)(struct gpio_chip *gc,
-						unsigned offset);
-	int			(*get_direction)(struct gpio_chip *gc,
-						unsigned offset);
-	int			(*direction_input)(struct gpio_chip *gc,
-						unsigned offset);
-	int			(*direction_output)(struct gpio_chip *gc,
-						unsigned offset, int value);
-	int			(*get)(struct gpio_chip *gc,
-						unsigned offset);
-	int			(*get_multiple)(struct gpio_chip *gc,
-						unsigned long *mask,
-						unsigned long *bits);
-	void			(*set)(struct gpio_chip *gc,
-						unsigned offset, int value);
-	void			(*set_multiple)(struct gpio_chip *gc,
-						unsigned long *mask,
-						unsigned long *bits);
-	int			(*set_config)(struct gpio_chip *gc,
-					      unsigned offset,
-					      unsigned long config);
-	int			(*to_irq)(struct gpio_chip *gc,
-						unsigned offset);
-
-	void			(*dbg_show)(struct seq_file *s,
-						struct gpio_chip *gc);
-
-	int			(*init_valid_mask)(struct gpio_chip *gc,
-						   unsigned long *valid_mask,
-						   unsigned int ngpios);
-
-	int			(*add_pin_ranges)(struct gpio_chip *gc);
+	int	(*request)(struct gpio_chip *gc, unsigned int offset);
+	void	(*free)(struct gpio_chip *gc, unsigned int offset);
+	int	(*get_direction)(struct gpio_chip *gc, unsigned int offset);
+	int	(*direction_input)(struct gpio_chip *gc, unsigned int offset);
+	int	(*direction_output)(struct gpio_chip *gc,
+				    unsigned int offset, int value);
+	int	(*get)(struct gpio_chip *gc, unsigned int offset);
+	int	(*get_multiple)(struct gpio_chip *gc,
+				unsigned long *mask, unsigned long *bits);
+	void	(*set)(struct gpio_chip *gc, unsigned int offset, int value);
+	void	(*set_multiple)(struct gpio_chip *gc,
+				unsigned long *mask, unsigned long *bits);
+	int	(*set_config)(struct gpio_chip *gc,
+			      unsigned int offset, unsigned long config);
+	int	(*to_irq)(struct gpio_chip *gc, unsigned int offset);
+	void	(*dbg_show)(struct seq_file *s, struct gpio_chip *gc);
+	int	(*init_valid_mask)(struct gpio_chip *gc,
+				   unsigned long *valid_mask,
+				   unsigned int ngpios);
+	int	(*add_pin_ranges)(struct gpio_chip *gc);
 
 	int			base;
 	u16			ngpio;
@@ -458,13 +444,12 @@ struct gpio_chip {
 #endif /* CONFIG_OF_GPIO */
 };
 
-extern const char *gpiochip_is_requested(struct gpio_chip *gc,
-			unsigned offset);
+const char *gpiochip_is_requested(struct gpio_chip *gc, unsigned int offset);
 
 /* add/remove chips */
-extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
-				      struct lock_class_key *lock_key,
-				      struct lock_class_key *request_key);
+int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
+			       struct lock_class_key *lock_key,
+			       struct lock_class_key *request_key);
 
 /**
  * gpiochip_add_data() - register a gpio_chip
@@ -504,12 +489,12 @@ static inline int gpiochip_add(struct gpio_chip *gc)
 {
 	return gpiochip_add_data(gc, NULL);
 }
-extern void gpiochip_remove(struct gpio_chip *gc);
-extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
-				  void *data);
+void gpiochip_remove(struct gpio_chip *gc);
+int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
+			   void *data);
 
-extern struct gpio_chip *gpiochip_find(void *data,
-			      int (*match)(struct gpio_chip *gc, void *data));
+struct gpio_chip *gpiochip_find(void *data,
+				int (*match)(struct gpio_chip *gc, void *data));
 
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
@@ -657,9 +642,9 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
 }
 #endif /* CONFIG_LOCKDEP */
 
-int gpiochip_generic_request(struct gpio_chip *gc, unsigned offset);
-void gpiochip_generic_free(struct gpio_chip *gc, unsigned offset);
-int gpiochip_generic_config(struct gpio_chip *gc, unsigned offset,
+int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
+void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
+int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config);
 
 /**

