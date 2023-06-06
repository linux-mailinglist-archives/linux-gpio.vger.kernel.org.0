Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23ADE723539
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 04:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbjFFCWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 22:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbjFFCWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 22:22:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17530116
        for <linux-gpio@vger.kernel.org>; Mon,  5 Jun 2023 19:22:46 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b0424c5137so48508845ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jun 2023 19:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686018166; x=1688610166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGvDZ2i0/7cwJ2i+7LGSyaWJakPS30tZuSzHrJmlTak=;
        b=eMN2eTzTXsIIL8nK+MrCHwIVqze/va2g0aEiGcAYD3PGCFil/O+HtbngslEA3YEiak
         65cjzVMJxwAjAV+BW2EwbWl5drgGiJbP7vCS2rFvI8Xv6zoOYRsTpPjz6be+pYHMKXf0
         xcqiqZ9y+xYGUdN6rOKsBfhOupNmwx6UmSYq26glor/+UVFyfBSnIMmypz98DeS6iJhV
         W0oQiAk/cic/ALLd6JnyElwip0BERIKIKDa6c/eem6lPt2/NfTOwasuUh5+fYeNABkek
         q1KRa/jeM/zXPJo8ndyh2DjyozelMcgRQN1l9lxiR4/XHnjRuwibIao/FtLTYZV6Yv8O
         HcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686018166; x=1688610166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGvDZ2i0/7cwJ2i+7LGSyaWJakPS30tZuSzHrJmlTak=;
        b=ZhQ/ySSTGHqOZUiGbrxtVqxOhl439AFc7uV2E/D/6ibG3cebbSfjbSAy5iy4IvmhZT
         OX3F7AtbomjLWqTyD9FWdvHC/1O+F6wLOg3/5TLw6eTJyBnvFVl9QInz96PML14RKKHa
         qFsqulPcwVmbtbM73GMWtgnJPwOCLKlcaZgNfS93dpFj9XHSXASYkH1dHpFvDYAWG9nB
         Ag/odQ9473XfQ7MNNDrO2x4/UsBJEqJItayPyYOvwQBivWAlQ+2MLtdxc5gKSoG74Ag7
         qZqdTDGvoIbBTyYOboE/Dd88MDKtg1R8oy1rs5zXVQkgtsll+0lLkAm8Eb63S6WUAMjG
         zfmA==
X-Gm-Message-State: AC+VfDzqC5BCZ0eL7Qj40JQEetWKmdyW6cLV4Q9naXuxQVs6wibTwQ4k
        jyYdA6hMb5IXa6ElKOPNRCM=
X-Google-Smtp-Source: ACHHUZ7e+wsg+gDvg9Edb0cCT51ulB4ZriYqKXwCxYnAe1IKgyqXyp3vDCKQQLDZrNVaaonzW3lXRQ==
X-Received: by 2002:a17:902:ecc7:b0:1b0:4b65:79db with SMTP id a7-20020a170902ecc700b001b04b6579dbmr649653plh.63.1686018166291;
        Mon, 05 Jun 2023 19:22:46 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902b78400b001b03d543549sm7247967pls.72.2023.06.05.19.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:22:45 -0700 (PDT)
Date:   Tue, 6 Jun 2023 10:22:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gabriel Matni <gabriel.matni@exfo.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add idle-timeout
 option
Message-ID: <ZH6YcW4zp6YDizg5@sol>
References: <PH8PR11MB7142857DBF772D017D8148778652A@PH8PR11MB7142.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR11MB7142857DBF772D017D8148778652A@PH8PR11MB7142.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 06, 2023 at 01:32:26AM +0000, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> Add an idle timeout option to gpiomon and gpionotify to exit gracefully
> when no event has been detected for a given period.
> 
> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>

The text looks good, but I can't apply it as your mailer has line
wrapped it, and done other fun things.

Can you resend it with "git send-email", or tell your mail client to send
untouched text[1]?

Thanks,
Kent.
[1] https://www.kernel.org/doc/html/latest/process/email-clients.html
