Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A055FD376
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Oct 2022 05:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiJMDKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 23:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiJMDKD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 23:10:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A6314D14
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:10:01 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id fw14so785065pjb.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 20:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eG29Fn2MNClHCkPL7lBHeZAy6uHVw1WIKTutGXKEagw=;
        b=CXkwVj3FFmgc5gJZktsfu3BAiK2Ic3gfQAn1SJYTmeY6oeKtY2ne1Cvfx2b8X1S4jE
         yCIj+w4s6L3Sq7+/J1tEicq5EG2cjCGKf++nPhtW7d05cDR4qdRHpx+48bcBbYYpFVl6
         BE0bfvWN3EbE3UnwljLhOcS2yJe7E4ofVzR3QZf5T4URlHVCTM5xe7NSdc8G6I+PS9wa
         yMKF0QZkarLJHw+1UJA1AOQnzbrABvDCJxpr2n0mPwYh0u5MzgIMW80E/gsK3a6BcyrC
         V3H/m64MwEbUWdCvrLFPz0EGcxwN3tmt6ozpKzfchEiorYpQ93ia2jv6Is2dWeryqh59
         M8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG29Fn2MNClHCkPL7lBHeZAy6uHVw1WIKTutGXKEagw=;
        b=X0GyjL4DBnmcRQxq+0GRkqmGI3RNVOq5c5U/O/nslVZy3DMqhmiQRywHAvGVof3f5X
         ZDfuL/dOGQ2Onkxo0lVIZeJLPaBDADY12qrzYXGHxOnkEsN6BHkxQrwvyoHAkEaThuTE
         215axi9FIT2dyJTu8ID6QBh/Efzg8cF75KQdppqIjJxZbfew2Q2nGo0mrzjeIihHcAEr
         iDZRZVPVttaT+wvKRf4OGgYzbXsBZYVEcA3l/s3tfYyUyDcSsa6X2HTBV0Xeh+Y82QSC
         cQYoQAxHxAhbFyIEpBZNV4PcPKnEw06hLcMJpfEwrc9hq5WzgH097oweV2TJpY2usTxl
         w2Hg==
X-Gm-Message-State: ACrzQf1FFZA0U43TWQ6BspvWcOkawJbkPevRu09hyCQpc3dhfTOTMkLT
        I0zhxnfanQzRvTqgpl3Y+Qw=
X-Google-Smtp-Source: AMsMyM5oncpFbkJ6BJuCcyhk11x03Ugz9Y0LZYs9Y8I8IARRne/0B9qAUz1RB4lb7rnjQZhZ7Vj5Ug==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id on4-20020a17090b1d0400b0020bcb4004b3mr8348354pjb.215.1665630601403;
        Wed, 12 Oct 2022 20:10:01 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b15-20020a1709027e0f00b001837b19ebb8sm4543523plm.244.2022.10.12.20.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 20:10:00 -0700 (PDT)
Date:   Thu, 13 Oct 2022 11:09:56 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 3/4] bindings: python: add tests
Message-ID: <Y0eBhAHwXZzLaF4x@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007145521.329614-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 07, 2022 at 04:55:20PM +0200, Bartosz Golaszewski wrote:
> This adds a test-suite for python bindings based on the gpio-sim kernel
> module.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

<snip>

> +	for (modconst = module_constants; modconst->name; modconst++) {
> +		ret = PyModule_AddIntConstant(module,
> +					      modconst->name, modconst->val);
> +		if (ret) {
> +			Py_DECREF(module);
> +			return NULL;
> +		}
> + 	}
   ^
space before tab

<snip>

> +
> +    # TODO buffer capacity
> +    # def test_read_over_buffer_capacity(self):
> +    #     buf = gpiod.EdgeEventBuffer(2)
> +    #     self.assertTrue(self.request.wait_edge_event(datetime.timedelta(seconds=1)))
> +    #     self.assertEqual(self.request.read_edge_event(buf), 2)
> +    #     self.assertEqual(len(buf), 2)
> +

Why the TODO?  That API has been changed since, no?

So no problems with the tests, though admittedly I've only skimmed them
relative to the other patches as I'm doing them last and have reached the
limits of my attention span.  I may have another look later, but I'd
rather get the other reviews out now than wait until I'm up to that.

Cheers,
Kent.
