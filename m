Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72E7709623
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 13:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjESLSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 07:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbjESLSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 07:18:05 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7C4E50
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 04:18:04 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3093a7b71fbso2986669f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684495082; x=1687087082;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=Ag5FcKX1Vk57wLPP8XginMEREfLSgBmFPRowYyBYpbj98dfxw2nrPY+pjWHF7txa3f
         /RA6XHojR4ICc/NDzRBWGdquz0mMUh5cSKSzpMcsRhbfSgiuQLVNMSQjiUSV1MG9Vvz0
         s8WdREjLNZFnhjFkReUI9m4oWW+mAvW3yEQuJlQfeZfulZvCfAhQsON+Il2UbDAUeJQS
         Tas6qtDF27Yv9for6B6iotHkkyt1d98AohLcauid2eb4yzBKiXi+e07vNdkPgTQXkK9m
         OmQaYRauYKALQ7Mu9Y6QPNRvTGBwcoaJSpx88uRQeB6UXetk7PfOOy+k8Lff5bSzlC1c
         BwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684495082; x=1687087082;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmxaI1amCfTksu6ynk2557PwK0HJxrBQmYIx/Pz5hBs=;
        b=LN0eAadzgHCXhZ3VGk1qpHsy/vVKmqKzhzuQzlhSQJPOKZt6oHdBwShSOfEpiUVJee
         /pFhVTEOlSuFLz+w3NOK9XJMQq5pTPuykORUV30+XxBWCpm1JL15kAuXIZ/z7ID2OqFP
         2+jB6WlZbXbA2qqJNL+RPHko988DqYX01PfEQy3H0U2U8CZtqF2/fDzbKs76Nrne103F
         V7zOS3Kavvk/CZRlb8BBq8YLRQlkh91CkNXPWBwgTbx94BjYMxpTnC/R4+4IEm2PkIjh
         01HY0dW4WZWS/XTM+rdH9UtRkwi3TKAg6fzkFG/7Z6Yc5n0giE81daNUi9oD2i+OxZle
         zhEg==
X-Gm-Message-State: AC+VfDxODq7Pk/cTxf8gghTIUAA9/snvSUk/3w8HmLmbvJGX5j6Cbq+s
        ox+4CRxOirUJheAe3QkZ4t0h/EIN+K5fSX+t4/2DOuPRO0T5LA==
X-Google-Smtp-Source: ACHHUZ4GcdKjctEWmkMJD/Q5ZDCusH7zrjV+w4c4EgP8GDbM+BMa7NNuPpP4cOMUW2oAUk/kOHHzW6hqw5zKR98kQX0=
X-Received: by 2002:a17:907:1b12:b0:8b8:c06e:52d8 with SMTP id
 mp18-20020a1709071b1200b008b8c06e52d8mr1298232ejc.36.1684495062361; Fri, 19
 May 2023 04:17:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7dab:b0:94f:7d03:8e8b with HTTP; Fri, 19 May 2023
 04:17:41 -0700 (PDT)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly199@gmail.com>
Date:   Fri, 19 May 2023 04:17:41 -0700
Message-ID: <CAM7Z2JAd00KW6b=O8M27vwRnsJ1w3AmDO5tP+gSmzkaHvk6=CA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you. I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibal
