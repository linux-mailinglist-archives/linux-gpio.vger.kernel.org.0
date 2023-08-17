Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD75A77F8CB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 16:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351851AbjHQOYh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 10:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351957AbjHQOYe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 10:24:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2912D79
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 07:24:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5231410ab27so10126741a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692282272; x=1692887072;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=jRYz2JZDAWxwzz3lJ8GRSGtOaugy+83BPiXOFkkPM6xQQdJaTZVzb2ycUbIT94kuEY
         6p5Gyw9NDLBDv3NqHYJo8IkAKecBfQhUht9tN49XYJYZkd1w+5k7ruby2vTtYjE68u5b
         9IKil9t4v7VhGRECEH4Ye10USDG0mGhjQW02mCAtXcXHOSJj2EdVn6l59ojpZzm3WrWR
         pGe171882Q5odAcsTAlq2xrqaPlo4tAJp/a+q2XDMm5MvPyVt2TROvmHwwLLFPMon7+1
         qlwM16AUUE/SHGFDxAlbbK5cg8AfqUD54RNGaTe0lsuwxytTApvlWTeItUaMy8L4blHZ
         0Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692282272; x=1692887072;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/krrOzf32PMDRBi/P9qe9m671OONK8NSr+9AstJjJkE=;
        b=WLcnqEbmecFsCGTI+cTHXZ/kwzqCb1J+WVZv2QPwXnyNs2qHWlYvczJLwyt0NV795a
         On6re3VZ6rOK19KuIVvAb5D8wmThafyLparNkVdOxVKJYcQYmyTHAifQyJAqgdeglqbY
         2ml+QVXK9iTUXRjkyFHFmfKByE+PyJfABrl/YwhnK6Fg1zG7m1A3WVguG5Ia2w1cjC/G
         o7sqJkHdp5ulZFlD3zH0gmFZmb5gKaBhzenb/AfWyPbfGe09J9qW8M4qz4BAwL4PSP//
         cJdX2VIPe+qX14t9xLQ6fbqQyA8j4DkQHWQ2silQyYJLaBef+zGLa7gEi9GRzbb/mQEr
         ZEew==
X-Gm-Message-State: AOJu0YxRRWvSZtbhZSUyRaa0mkwFzfkQJtlS4S7TuUx+xn3uC4oRzrAU
        DuQJSdLkEYY75CQkacqDL8nuZr6YyTzW6At1UzA=
X-Google-Smtp-Source: AGHT+IEp4cCuFlG0W3egOgU3UR3lcsCJgAX/+lkPQqDslfwoGUC6G3BhxvV4XKDiqWt471tJpCzDDzh9qMjz30AEcJs=
X-Received: by 2002:aa7:d982:0:b0:523:2e30:aaea with SMTP id
 u2-20020aa7d982000000b005232e30aaeamr4213690eds.33.1692282271797; Thu, 17 Aug
 2023 07:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:8418:b0:51:35ae:ec4d with HTTP; Thu, 17 Aug 2023
 07:24:31 -0700 (PDT)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <acipqr@gmail.com>
Date:   Thu, 17 Aug 2023 16:24:31 +0200
Message-ID: <CACGB4dKL6GoE30n_=fa8NF+xCnb=ZcGV3WChtWi4x4jb3f9mEw@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
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
