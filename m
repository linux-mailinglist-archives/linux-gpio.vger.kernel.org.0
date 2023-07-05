Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29CF747E94
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 09:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjGEHvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jul 2023 03:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjGEHvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 03:51:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC6D1738
        for <linux-gpio@vger.kernel.org>; Wed,  5 Jul 2023 00:51:13 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991f956fb5aso620793866b.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jul 2023 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688543471; x=1691135471;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC+cCGWgN+hqK1bR6hUZHyjeD6zkoAo2b5jZR1Tcum4=;
        b=ijyCFsH6e2+HqayGY6Iczv/mjBfh/5vxdR/+r/tA+P+RYFEh2UacG+8YPydXezKE0e
         A1hwDRPFvU0kB4hr+L2LroCXf0lxlMV72e+dCFwv9hOMPCeuA2ehwxKD2dLLG6Sw91iH
         UoihPG6Rvt+dXHvFhasW5l364BR5rANFE2iUqHMD6bSndjwIGSY0GMey5qhiLvfJn2fP
         YQQuoLYGI4nUnzZdzW6vcJw1IxYKRdbvLAHct58V1yz4gqE2rkB9JMSraIIWcbWppdOH
         0Ii4NcfEQ695479GZWGjmtSyG5J7WlkPB2VdiepnUGFKGSgv/Kt18cfx2GuCSu6Kd6Ym
         5cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688543471; x=1691135471;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aC+cCGWgN+hqK1bR6hUZHyjeD6zkoAo2b5jZR1Tcum4=;
        b=SQ/Kq9cNHdAZ1id1pydJD0TUoMVfKEgmPYSSl+r6a0eJvTP9CNXTJK9eutHN3eaHAR
         D1tMRkk1IQbhuBcIssgzyCXRWKqg9J/exi7wPNbg4Y//SxBBmMqaQcTE3DZfc3OIyk0g
         eQE5TBhEKHe1L4wx5+ZWk23xwWHnYTgK5xTqyIc8QQdgDFAJmIivAF7jkBi8Q0Dlc7BA
         zjHrMjNlXCOLdpdirMbTyfMGhJrNXj5A1wMzM8Oz2ULbj6IxW4VPLdXrP7gE7gRrb7Yj
         zl4Eou+SnjRzhaIl6VC0ItfOh+W94eF7nYpk27LlcphXrYoIBtSXpfmrm4Zb81eMr4Oj
         7NKQ==
X-Gm-Message-State: ABy/qLbGNIdC73g91oY/8HqFPr7X7tVC6ivrS4P4rEwPgcaTobevAgRd
        p6En6zVGb1XJvnaqXOa2nZXCGOjO+68=
X-Google-Smtp-Source: APBJJlF+4gMyYwRTNjSQsZ8fRqovxfVKaeaVSjzEF93AQ/+6Aesx992CRf7dvWP4STdBHyDrpjKIQQ==
X-Received: by 2002:a17:906:f750:b0:993:4107:7e46 with SMTP id jp16-20020a170906f75000b0099341077e46mr5684424ejb.4.1688543470799;
        Wed, 05 Jul 2023 00:51:10 -0700 (PDT)
Received: from ?IPV6:2003:d6:2f0e:5001:de5c:a691:328c:8423? (p200300d62f0e5001de5ca691328c8423.dip0.t-ipconnect.de. [2003:d6:2f0e:5001:de5c:a691:328c:8423])
        by smtp.gmail.com with ESMTPSA id e14-20020a056402104e00b0051e27ebb1b3sm327628edu.34.2023.07.05.00.51.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 00:51:10 -0700 (PDT)
Message-ID: <a544afbc-5821-26d0-239e-b46a990ff0a0@gmail.com>
Date:   Wed, 5 Jul 2023 09:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From:   =?UTF-8?Q?Martin_Schr=c3=b6der?= <martin.schroeder78@gmail.com>
Content-Language: de-DE
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] libgpiod and conan 2.0 recipe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear developers,


i am trying to use the lib in my tiny project; but in conjuction with 
conan i get the following error:

*********************************************************
Recipe 'libgpiod/1.6.3' seems broken.
It is possible that this recipe is not Conan 2.0 ready
If the recipe comes from ConanCenter check: https://conan.io/cci-v2.html
If it is your recipe, check if it is updated to 2.0
*********************************************************

ERROR: Package 'libgpiod/1.6.3' not resolved: libgpiod/1.6.3: Cannot 
load recipe.
Error loading conanfile at 
'/home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py': Unable to 
load conanfile in /home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in 
_call_with_frames_removed
  File "/home/martin/.conan2/p/libgpf99e3cc2c7d92/e/conanfile.py", line 
1, in <module>
    from conans import ConanFile, tools, AutoToolsBuildEnvironment
ImportError: cannot import name 'ConanFile' from 'conans' 
(/home/martin/.local/lib/python3.10/site-packages/conans/__init__.py)
.

What can I do to fix this?

Thanks in advance

Martin

