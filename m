Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D644D9A43
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 12:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241134AbiCOLVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 07:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240084AbiCOLVm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 07:21:42 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7544F9C9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:20:30 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id d10so40456325eje.10
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkEmWZZScuRlVKHVcVT7asOeCpsc11rI2OdEilelRb0=;
        b=1+4d8uYPNhV/KynwWvLMgVfE1gDppvAoBsTdQ5Z1gXBmY+TlqqV0e0tToGhUibRAyg
         qc0Ub9rBUb9yNtL0PfA30Pu2evDMrQmhqTtWnJhsTWjREgyM4TlQKQUvyli4nWdlMc5q
         LmsO2+hT6nP8glVFkJVgfQ04jPAPkCm7wjXyruORYKdczTNoBX6GbFOm3M6CkvwTUGsm
         ZorW3oxtJFeN7tCpjXDSRpgxtNHT0RyQOHow7/XVwKAHsl77IcxnhhUpV+jYJOF9Q71/
         EseCpRsJCXUYpMKfLIjXjr5OCpYk+Y5fLYHvNCh15M7Zd4hd9K027pBClPJvUuJrso9/
         koKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkEmWZZScuRlVKHVcVT7asOeCpsc11rI2OdEilelRb0=;
        b=s+7cHxhW58L/6RAUPC9dfE+I5WroEutAkhFPfTG952io5Ss8cTG/pI5dJ8i0hJVS7f
         9Ogl8AEQL0S8VyhET9pcirSXCfPuSDuc5eF8iJke7NmFHXuIzsdcRcHZFWdoBEvSP3fB
         MYpqBa54svUhbjvA/pWTOFpoNA4eU4KKNty9zbM06pwhYbsBuMTPglS7x0OudYWGpsSD
         8MWqMbby7m2iD+KVSQkMDS/MQ2Jt2ZZidQOVopH9cBjZsfVE69VhCTqj6ha2lvrxinOi
         2WYiL1d5Bd5aTYeGWRSPCjhfv1Y0ZUFC2PkQP+TStiHPST3S/izOKZODmOPLfFuEJwYB
         htMA==
X-Gm-Message-State: AOAM532i/XHRPpGUQtt0KnopdG4NZeV9ApMGIs2zcFDSk9i7xBu5myP4
        hBvBqqumSyDaPrMy6S9olLPr24A5ZP7gM56emabj/ud17QcS2+Vx
X-Google-Smtp-Source: ABdhPJzIHO+/U1gro3snhGIv/VkfkZDgcZpZAH8PQnjMpBMV1JUpbE3nZL6oOy/obSC8ACoVqhw+bndZ/Wosi3wbMI8=
X-Received: by 2002:a17:907:97d4:b0:6db:ab53:1fe3 with SMTP id
 js20-20020a17090797d400b006dbab531fe3mr15565967ejc.492.1647343228725; Tue, 15
 Mar 2022 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220311073926.78636-1-warthog618@gmail.com> <20220311073926.78636-7-warthog618@gmail.com>
In-Reply-To: <20220311073926.78636-7-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 12:20:17 +0100
Message-ID: <CAMRc=Md2DOY9ZktCXvRakbk1vkdizHsauX3v6x=qCzXOgGWMcw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 6/6] doc: API documentation tweaks
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 11, 2022 at 8:41 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> A collection of tweaks to the API documentation in gpiod.h
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Thanks for doing this. I applied everything except for the following
rejects as I think we should keep num_values for the argument name.

Bart

--- include/gpiod.h
+++ include/gpiod.h
@@ -951,12 +969,13 @@
gpiod_line_config_set_output_value_override(struct gpiod_line_config
*config,
      unsigned int offset, int value);

 /**
- * @brief Override the output values for multiple offsets.
+ * @brief Override the output values for multiple lines.
  * @param config Line config object.
  * @param num_lines Number of lines for which to override values.
- * @param offsets Array of line offsets to override values for.
- * @param values Array of output values associated with the offsets passed in
- *               the previous argument.
+ * @param offsets Array of offsets indentifying the lines for which to override
+ *   values,  containing \p num_lines entries.
+ * @param values Array of output values corresponding to the lines
identified in
+ * \p offsets, also containing \p num_lines entries.
  */
 void gpiod_line_config_set_output_values(struct gpiod_line_config *config,
  size_t num_lines,
@@ -1090,57 +1107,60 @@ void gpiod_request_config_set_consumer(struct
gpiod_request_config *config,
         const char *consumer);

 /**
- * @brief Get the consumer string.
+ * @brief Get the consumer name configured in the request config.
  * @param config Request config object.
- * @return Current consumer string stored in this request config.
+ * @return Consumer name stored in the request config.
  */
 const char *
 gpiod_request_config_get_consumer(struct gpiod_request_config *config);

 /**
- * @brief Set line offsets for this request.
+ * @brief Set the offsets of the lines to be requested.
  * @param config Request config object.
- * @param num_offsets Number of offsets.
- * @param offsets Array of line offsets.
- * @note If too many offsets were specified, the offsets above the limit
+ * @param num_lines Number of lines, which specifies the size of the offsets
+ *   array.
+ * @param offsets Array of offsets of the lines.
+ * @note If too many lines were specified, the offsets above the limit
  *       accepted by the kernel (64 lines) are silently dropped.
  */
 void gpiod_request_config_set_offsets(struct gpiod_request_config *config,
-       size_t num_offsets,
+       size_t num_lines,
        const unsigned int *offsets);

 /**
- * @brief Get the number of lines configured in this request config.
+ * @brief Get the number of lines configured in the request config.
  * @param config Request config object.
- * @return Number of lines to be requested by this config.
+ * @return Number of lines to be requested by the config.
  */
 size_t
 gpiod_request_config_get_num_lines(struct gpiod_request_config *config);

 /**
- * @brief Get the hardware offsets of lines in this request config.
+ * @brief Get the offsets of lines configured in the request config.
  * @param config Request config object.
- * @param offsets Array to store offsets. Must hold at least the number of
- *                lines returned by ::gpiod_request_config_get_num_offsets.
+ * @param offsets Array to store offsets. Must be sized to hold the number of
+ *   lines returned by ::gpiod_request_config_get_num_lines.
  */
 void gpiod_request_config_get_offsets(struct gpiod_request_config *config,
-       unsigned int *offsets);
+     unsigned int *offsets);

 /**
- * @brief Set the size of the kernel event buffer.
+ * @brief Set the size of the kernel event buffer for the request.
  * @param config Request config object.
  * @param event_buffer_size New event buffer size.
  * @note The kernel may adjust the value if it's too high. If set to 0, the
  *       default value will be used.
+ * @note The kernel buffer is distinct from and independent of the user space
+ * buffer (::gpiod_edge_event_buffer_new).
  */
 void
 gpiod_request_config_set_event_buffer_size(struct gpiod_request_config *config,
     size_t event_buffer_size);

 /**
- * @brief Get the edge event buffer size from this request config.
+ * @brief Get the edge event buffer size for the request config.
  * @param config Request config object.
- * @return Current edge event buffer size setting.
+ * @return Edge event buffer size setting from the request config.
  */
 size_t
 gpiod_request_config_get_event_buffer_size(struct
gpiod_request_config *config);
