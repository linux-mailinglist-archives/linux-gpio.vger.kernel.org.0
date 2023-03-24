Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31AED6C7F2A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 14:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjCXN4h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 09:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjCXN4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 09:56:36 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CFC12CF6
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 06:56:36 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id n125so2228774ybg.7
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679666195;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=e8Zq4OJb+/TBGGoYtevjtZRW4mqQVX3PjgohDcOH0l9WHKdDOMiBEtAfn+vtP1scx1
         oI8XBcS/HpcsenrkYyfR83QRWNFrcEaFlqU3ZGBpDAMNEeKEKyEnY6UhC9dA4/YeZeOP
         fmiQ0V8pSqbSdpe3ylLwppLefHyh+lvCWPL37IaIxFfrjE7NnDIk/iXJPw2D3H2kzWJo
         mbjJAA0VthClcHCv0RNjSbHjDOpVTgSHj6durKTXWupz22vRUEMZP6lXm+Tx57LKmnHH
         GkBgc5x7veGq4CFX3Qn8N+obq5lxJAqyUSznkVQ9ehX+9QSWOLdJmruGAXJgOvis/qlx
         aLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679666195;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=eh6jhGxXupFMpIstGi+9X5lbb8Rq99X+U5g19vT1wO4oln7ToQ1bapCDySLtIhjtuP
         /AEIFpkbVmoDlls3uCg6YZ4RAZntYKjqzfSxtqijyVvgiawBJAlOXfSrWIVBfBqagntu
         EZZd/NYR4z/isnfYP2SVPJPSz35Nw9ZEMBt1aMygUT5ptuPTUnkwc6g0m6CsA8/pI9D4
         ZR2AlBP22HeNY+i7bJJaz6aLhvuE0s6SfOdL2gfqYeg3a/lZwlm28ZWvskqyYqQn5W9h
         CJT0wevrUlBDTJuMkTvdWkHkfcvm9aWdls6TJegr9J62MlcSg5YuddsXmS+WhR/XlR5x
         yITA==
X-Gm-Message-State: AAQBX9fitGOkYmmk89P8zSC+B3Z5T3Owcske0WBWaqPZYVpdK9gYiyz7
        wL2VIOXL/5XLX8flwV9F6mOfNY2OIm3QwV20SaU=
X-Google-Smtp-Source: AKy350ZDJThhFa+xNSpaynD3etjO+ZOcV/LIVCEIlxtzAHyBxWK28S080nZP6VBGzosJmQAZUPRPtQUkIblsPDfvubc=
X-Received: by 2002:a05:6902:120c:b0:b74:77fa:581d with SMTP id
 s12-20020a056902120c00b00b7477fa581dmr1138987ybu.4.1679666194693; Fri, 24 Mar
 2023 06:56:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:630f:b0:2ea:1d7b:2ac2 with HTTP; Fri, 24 Mar 2023
 06:56:34 -0700 (PDT)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <tracymedicinemed04@gmail.com>
Date:   Fri, 24 Mar 2023 14:56:34 +0100
Message-ID: <CACpKaVTG4a6FXX2kM2SpAP307d8_mupXEEZ_3ty+SS8-UgHjcg@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-- 
Hello Dear
My name is Dr Ava Smith,a medical doctor from United States.
I have Dual citizenship which is English and French.
I will share pictures and more details about me as soon as i get
a response from you
Thanks
Ava
